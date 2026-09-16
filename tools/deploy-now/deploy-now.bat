@echo off
rem ============================================================================
rem  deploy-now.bat  -  OPTCG 게임 서버(Multiroptcg = Multirole 포크) 설치·실행기
rem
rem  이 파일이 있는 폴더(예: C:\Users\xnaud\Downloads\TalkFile_deploy-now)에
rem  Multirole 서버를 설치하고, 같은 자리에서 바로 실행한다.
rem
rem   더블클릭                : 설치(없는 것만) + 서버 실행. 창을 닫으면 서버도 꺼진다.
rem   deploy-now.bat install  : 설치만
rem   deploy-now.bat run      : 실행만
rem   deploy-now.bat reload   : 켜져 있는 서버에 카드 데이터(GitHub OPTCG) 즉시 갱신
rem   deploy-now.bat stop     : 서버 종료
rem   deploy-now.bat firewall : 방화벽 인바운드 규칙(TCP 7911/7922)만 등록 - 관리자 권한
rem
rem  서버 바이너리 : https://github.com/ClaudeFable5/OPTCG/releases/tag/server-win32
rem                  ClaudeFable5/Multiroptcg 를 GitHub Actions(server-win32.yml)가 Win32로 빌드
rem  카드 데이터   : https://github.com/ClaudeFable5/OPTCG  script/ cards-opcg.cdb ocgcore.dll lflists/
rem                  서버가 켜질 때마다 fetch + reset 으로 최신화한다.
rem ============================================================================
setlocal EnableExtensions DisableDelayedExpansion
chcp 65001 >nul
cd /d "%~dp0"
title OPTCG 서버 - Multiroptcg

set "SERVER_DIR=%~dp0"
set "ZIP_NAME=Multiroptcg-win32.zip"
set "ZIP_URL=https://github.com/ClaudeFable5/OPTCG/releases/download/server-win32/Multiroptcg-win32.zip"
set "DATA_REMOTE=https://github.com/ClaudeFable5/OPTCG.git"
set "DUEL_PORT=7911"
set "LOBBY_PORT=7922"
set "WEBHOOK_PORT=34343"
set "WEBHOOK_TOKEN=optcg-drop-apply"
set "FW_RULE=OPTCG Multiroptcg"

if /i "%~1"=="install"  goto :cmd_install
if /i "%~1"=="run"      goto :cmd_run
if /i "%~1"=="reload"   goto :cmd_reload
if /i "%~1"=="stop"     goto :cmd_stop
if /i "%~1"=="firewall" goto :cmd_firewall
if not "%~1"=="" goto :cmd_help

rem ---- 기본 동작: 설치 + 실행 ----
call :install || goto :fail
call :run || goto :fail
goto :end

:cmd_install
call :install || goto :fail
echo.
echo  설치 완료. 서버를 켜려면 deploy-now.bat 을 더블클릭하거나  deploy-now.bat run
goto :end

:cmd_run
call :run || goto :fail
goto :end

:cmd_reload
call :reload || goto :fail
goto :end

:cmd_stop
call :stop || goto :fail
goto :end

:cmd_firewall
call :firewall_add || goto :fail
goto :end

:cmd_help
echo.
echo  deploy-now.bat            설치 + 서버 실행
echo  deploy-now.bat install    설치만
echo  deploy-now.bat run        실행만
echo  deploy-now.bat reload     켜진 서버에 카드 데이터 갱신
echo  deploy-now.bat stop       서버 종료
echo  deploy-now.bat firewall   방화벽 규칙 등록 - 관리자 권한
goto :end

:fail
echo.
echo  [실패] 위 메시지를 확인하세요.
if not defined DEPLOY_NOW_CI pause
exit /b 1

:end
exit /b 0


rem ============================================================================
rem  설치
rem ============================================================================
:install
echo.
echo ==== OPTCG 서버 설치 : %SERVER_DIR%
call :ensure_binaries || exit /b 1
call :ensure_config || exit /b 1
if not exist "sync\" mkdir "sync"
if not exist "tmp\" mkdir "tmp"
if not exist "replays\" mkdir "replays"
call :firewall_ensure
exit /b 0

:ensure_binaries
if exist "multirole.exe" if exist "hornet.exe" (
    echo  [OK] multirole.exe / hornet.exe 있음
    exit /b 0
)
if exist "%ZIP_NAME%" (
    echo  [..] 폴더에 있는 %ZIP_NAME% 사용
) else (
    echo  [..] 서버 바이너리 다운로드
    echo       %ZIP_URL%
    call :download "%ZIP_URL%" "%ZIP_NAME%" || (
        echo  [X] 다운로드 실패. 인터넷 연결을 확인하거나 %ZIP_NAME% 을 이 폴더에 직접 넣으세요.
        exit /b 1
    )
    call :download "%ZIP_URL%.sha256" "%ZIP_NAME%.sha256" >nul 2>&1
)
call :verify_zip || exit /b 1
call :extract_zip || exit /b 1
if not exist "multirole.exe" (
    echo  [X] 압축 안에 multirole.exe 가 없습니다.
    exit /b 1
)
if not exist "hornet.exe" (
    echo  [X] 압축 안에 hornet.exe 가 없습니다.
    exit /b 1
)
echo  [OK] 서버 바이너리 설치됨
if exist "VERSION.txt" type "VERSION.txt"
exit /b 0

:download
rem %1 = URL, %2 = 저장 파일
where curl.exe >nul 2>&1
if not errorlevel 1 (
    curl.exe -fSL --retry 3 --retry-delay 2 -o "%~2" "%~1" && exit /b 0
    del /q "%~2" >nul 2>&1
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -UseBasicParsing -Uri '%~1' -OutFile '%~2'; exit 0 } catch { Write-Host $_.Exception.Message; exit 1 }"
if errorlevel 1 (
    del /q "%~2" >nul 2>&1
    exit /b 1
)
exit /b 0

:verify_zip
if not exist "%ZIP_NAME%.sha256" (
    echo  [..] 체크섬 파일 없음 - 검증 생략
    exit /b 0
)
set "EXPECTED="
for /f "usebackq" %%a in ("%ZIP_NAME%.sha256") do if not defined EXPECTED set "EXPECTED=%%a"
set "ACTUAL="
for /f "usebackq delims=" %%h in (`powershell -NoProfile -ExecutionPolicy Bypass -Command "(Get-FileHash -Algorithm SHA256 -LiteralPath '%ZIP_NAME%').Hash.ToLower()"`) do set "ACTUAL=%%h"
if not defined ACTUAL (
    echo  [..] 해시 계산 불가 - 검증 생략
    exit /b 0
)
if /i not "%EXPECTED%"=="%ACTUAL%" (
    echo  [X] %ZIP_NAME% 체크섬 불일치 - 내려받은 파일이 깨졌습니다. 삭제 후 다시 실행하세요.
    echo      기대값 %EXPECTED%
    echo      실제값 %ACTUAL%
    exit /b 1
)
echo  [OK] 체크섬 확인 %ACTUAL%
exit /b 0

:extract_zip
set "EXTRACT_DIR=%SERVER_DIR%_extract"
if exist "%EXTRACT_DIR%\" rmdir /s /q "%EXTRACT_DIR%"
mkdir "%EXTRACT_DIR%"
where tar.exe >nul 2>&1
if not errorlevel 1 (
    tar.exe -xf "%ZIP_NAME%" -C "%EXTRACT_DIR%"
) else (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -LiteralPath '%ZIP_NAME%' -DestinationPath '%EXTRACT_DIR%' -Force"
)
if not exist "%EXTRACT_DIR%\multirole.exe" (
    echo  [X] 압축 해제 실패 - %ZIP_NAME% 을 지우고 다시 실행하세요.
    rmdir /s /q "%EXTRACT_DIR%" >nul 2>&1
    exit /b 1
)
copy /y "%EXTRACT_DIR%\multirole.exe" . >nul
copy /y "%EXTRACT_DIR%\hornet.exe" . >nul
if exist "%EXTRACT_DIR%\VERSION.txt" copy /y "%EXTRACT_DIR%\VERSION.txt" . >nul
if exist "%EXTRACT_DIR%\README.md" if not exist "README.md" copy /y "%EXTRACT_DIR%\README.md" . >nul
if exist "%EXTRACT_DIR%\config.json" if not exist "config.json" copy /y "%EXTRACT_DIR%\config.json" . >nul
rem deploy-now.bat 자신은 실행 중이므로 압축 안의 사본으로 덮어쓰지 않는다.
rmdir /s /q "%EXTRACT_DIR%" >nul 2>&1
exit /b 0

:ensure_config
if exist "config.json" (
    echo  [OK] config.json 있음 - 그대로 사용
    exit /b 0
)
echo  [..] config.json 생성 - 카드 데이터 원본: %DATA_REMOTE%
call :write_config "config.json"
exit /b 0

:write_config
> "%~1" echo {
>>"%~1" echo   "concurrencyHint": -1,
>>"%~1" echo   "lobbyListingPort": %LOBBY_PORT%,
>>"%~1" echo   "lobbyMaxConnections": 4,
>>"%~1" echo   "roomHostingPort": %DUEL_PORT%,
>>"%~1" echo   "repos": [
>>"%~1" echo     {
>>"%~1" echo       "name": "optcg-data",
>>"%~1" echo       "remote": "%DATA_REMOTE%",
>>"%~1" echo       "path": "./sync/optcg-data/",
>>"%~1" echo       "webhookPort": %WEBHOOK_PORT%,
>>"%~1" echo       "webhookToken": "%WEBHOOK_TOKEN%"
>>"%~1" echo     }
>>"%~1" echo   ],
>>"%~1" echo   "banlistProvider": {
>>"%~1" echo     "observedRepos": ["optcg-data"],
>>"%~1" echo     "fileRegex": ".*\\.lflist\\.conf"
>>"%~1" echo   },
>>"%~1" echo   "coreProvider": {
>>"%~1" echo     "observedRepos": ["optcg-data"],
>>"%~1" echo     "fileRegex": ".*ocgcore\\.dll",
>>"%~1" echo     "tmpPath": "./tmp/",
>>"%~1" echo     "coreType": "hornet",
>>"%~1" echo     "loadPerRoom": true
>>"%~1" echo   },
>>"%~1" echo   "dataProvider": {
>>"%~1" echo     "observedRepos": ["optcg-data"],
>>"%~1" echo     "fileRegex": ".*\\.cdb"
>>"%~1" echo   },
>>"%~1" echo   "logHandler": {
>>"%~1" echo     "serviceSinks": {
>>"%~1" echo       "gitRepo": { "type": "stdout", "properties": {} },
>>"%~1" echo       "multirole": { "type": "stdout", "properties": {} },
>>"%~1" echo       "banlistProvider": { "type": "stdout", "properties": {} },
>>"%~1" echo       "coreProvider": { "type": "stdout", "properties": {} },
>>"%~1" echo       "dataProvider": { "type": "stdout", "properties": {} },
>>"%~1" echo       "logHandler": { "type": "stdout", "properties": {} },
>>"%~1" echo       "replayManager": { "type": "stdout", "properties": {} },
>>"%~1" echo       "scriptProvider": { "type": "stdout", "properties": {} },
>>"%~1" echo       "other": { "type": "stdout", "properties": {} }
>>"%~1" echo     },
>>"%~1" echo     "ecSinks": {
>>"%~1" echo       "core": { "type": "stderr", "properties": {} },
>>"%~1" echo       "official": { "type": "stderr", "properties": {} },
>>"%~1" echo       "speed": { "type": "stderr", "properties": {} },
>>"%~1" echo       "rush": { "type": "stderr", "properties": {} },
>>"%~1" echo       "other": { "type": "stderr", "properties": {} }
>>"%~1" echo     },
>>"%~1" echo     "roomLogging": { "enabled": false, "path": "./room-logs/" }
>>"%~1" echo   },
>>"%~1" echo   "replayManager": { "save": true, "path": "./replays/" },
>>"%~1" echo   "scriptProvider": {
>>"%~1" echo     "observedRepos": ["optcg-data"],
>>"%~1" echo     "fileRegex": ".*\\.lua"
>>"%~1" echo   }
>>"%~1" echo }
exit /b 0


rem ============================================================================
rem  방화벽 - 인바운드 TCP 7911(듀얼) / 7922(방 목록)
rem ============================================================================
:firewall_ensure
if defined DEPLOY_NOW_NO_FIREWALL exit /b 0
netsh advfirewall firewall show rule name="%FW_RULE% %DUEL_PORT%" >nul 2>&1
if not errorlevel 1 (
    netsh advfirewall firewall show rule name="%FW_RULE% %LOBBY_PORT%" >nul 2>&1
    if not errorlevel 1 (
        echo  [OK] 방화벽 규칙 있음 - TCP %DUEL_PORT% / %LOBBY_PORT%
        exit /b 0
    )
)
net session >nul 2>&1
if not errorlevel 1 (
    call :firewall_add
    exit /b 0
)
echo  [..] 방화벽 규칙 등록에 관리자 권한이 필요합니다 - UAC 창이 뜨면 '예'를 누르세요
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { $p = Start-Process -FilePath '%~f0' -ArgumentList 'firewall' -Verb RunAs -Wait -PassThru -ErrorAction Stop; exit $p.ExitCode } catch { exit 1 }"
if errorlevel 1 (
    echo  [!] 방화벽 규칙을 등록하지 못했습니다. 외부에서 접속이 안 되면
    echo      관리자 권한 명령 프롬프트에서  deploy-now.bat firewall  을 실행하세요.
) else (
    echo  [OK] 방화벽 규칙 등록됨
)
exit /b 0

:firewall_add
net session >nul 2>&1
if errorlevel 1 (
    echo  [X] 관리자 권한이 필요합니다. 마우스 오른쪽 - 관리자 권한으로 실행
    exit /b 1
)
netsh advfirewall firewall delete rule name="%FW_RULE% %DUEL_PORT%" >nul 2>&1
netsh advfirewall firewall delete rule name="%FW_RULE% %LOBBY_PORT%" >nul 2>&1
netsh advfirewall firewall add rule name="%FW_RULE% %DUEL_PORT%" dir=in action=allow protocol=TCP localport=%DUEL_PORT% profile=any >nul || exit /b 1
netsh advfirewall firewall add rule name="%FW_RULE% %LOBBY_PORT%" dir=in action=allow protocol=TCP localport=%LOBBY_PORT% profile=any >nul || exit /b 1
echo  [OK] 방화벽 인바운드 허용 - TCP %DUEL_PORT% 및 %LOBBY_PORT%
exit /b 0


rem ============================================================================
rem  실행 - multirole.exe 를 감시하며 죽으면 3초 뒤 다시 띄운다
rem ============================================================================
:run
if not exist "multirole.exe" (
    echo  [X] multirole.exe 가 없습니다. 먼저  deploy-now.bat install
    exit /b 1
)
if not exist "config.json" (
    echo  [X] config.json 이 없습니다. 먼저  deploy-now.bat install
    exit /b 1
)
call :is_running && (
    echo  [!] 서버가 이미 실행 중입니다 - 이 창은 닫아도 됩니다.
    if not defined DEPLOY_NOW_CI pause
    exit /b 0
)
if exist "stop.flag" del /q "stop.flag"
if exist "cacert.pem" set "SSL_CERT_FILE=%SERVER_DIR%cacert.pem"
call :show_info
set /a FAST_FAILS=0
:run_loop
call :now START_TS
echo.
echo [%date% %time%] multirole.exe 시작 - 듀얼 %DUEL_PORT% / 방 목록 %LOBBY_PORT% / 웹훅 %WEBHOOK_PORT%
echo   첫 실행이면 GitHub 에서 카드 데이터를 받느라 몇 분 걸릴 수 있습니다. 창을 닫지 마세요.
multirole.exe
set "RC=%errorlevel%"
taskkill /f /im hornet.exe >nul 2>&1
if exist "stop.flag" goto :run_stopped
call :now END_TS
set "ELAPSED=999"
if defined START_TS if defined END_TS set /a ELAPSED=END_TS-START_TS
if %ELAPSED% LSS 20 (set /a FAST_FAILS+=1) else (set /a FAST_FAILS=0)
if %FAST_FAILS% GEQ 3 (
    echo.
    echo  [X] 서버가 시작 직후 계속 종료됩니다 - 종료 코드 %RC%. 위 로그를 확인하세요.
    echo      흔한 원인: 포트 %DUEL_PORT%/%LOBBY_PORT%/%WEBHOOK_PORT% 사용 중, config.json 오류, 첫 실행인데 인터넷 연결 없음
    if not defined DEPLOY_NOW_CI pause
    exit /b 1
)
echo [%date% %time%] 서버 종료 - 코드 %RC%. 3초 후 다시 시작합니다. 끝내려면 창을 닫거나  deploy-now.bat stop
ping -n 4 127.0.0.1 >nul
if exist "stop.flag" goto :run_stopped
goto :run_loop

:run_stopped
del /q "stop.flag" >nul 2>&1
echo [%date% %time%] 서버를 중지했습니다.
exit /b 0

:now
rem %1 = 결과 변수. 유닉스 초.
set "%~1="
for /f %%s in ('powershell -NoProfile -Command "[DateTimeOffset]::UtcNow.ToUnixTimeSeconds()"') do set "%~1=%%s"
exit /b 0

:is_running
tasklist /fi "imagename eq multirole.exe" 2>nul | find /i "multirole.exe" >nul
exit /b %errorlevel%

:show_info
echo.
echo ---- 접속 정보 ----
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do echo   내부 IP :%%a
if not defined DEPLOY_NOW_CI (
    where curl.exe >nul 2>&1 && for /f "delims=" %%p in ('curl.exe -s --max-time 5 https://api.ipify.org 2^>nul') do echo   공인 IP : %%p
)
echo   클라이언트 서버 설정: address = 공인 IP, duelport = %DUEL_PORT%, roomlistport = %LOBBY_PORT%
echo   공유기를 쓰면 TCP %DUEL_PORT%, %LOBBY_PORT% 포트포워딩이 필요합니다.
echo -------------------
exit /b 0


rem ============================================================================
rem  갱신 / 종료
rem ============================================================================
:reload
call :is_running || (
    echo  [X] 서버가 실행 중이 아닙니다. 다음에 켤 때 최신 데이터를 자동으로 받습니다.
    exit /b 1
)
echo  [..] 카드 데이터 갱신 요청 - http://localhost:%WEBHOOK_PORT%/
where curl.exe >nul 2>&1
if not errorlevel 1 (
    curl.exe -s -X POST --max-time 120 --data "%WEBHOOK_TOKEN%" "http://localhost:%WEBHOOK_PORT%/%WEBHOOK_TOKEN%"
) else (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "(Invoke-WebRequest -UseBasicParsing -Method Post -Body '%WEBHOOK_TOKEN%' -Uri 'http://localhost:%WEBHOOK_PORT%/%WEBHOOK_TOKEN%' -TimeoutSec 120).Content"
)
echo.
echo  [OK] 요청 보냄 - 서버 창에 Webhook triggered / Finished updating 이 찍히면 완료
exit /b 0

:stop
call :is_running || (
    echo  [..] 실행 중인 서버가 없습니다.
    exit /b 0
)
echo  [..] 서버 종료 중...
> "stop.flag" echo stop
taskkill /f /im multirole.exe >nul 2>&1
taskkill /f /im hornet.exe >nul 2>&1
ping -n 3 127.0.0.1 >nul
del /q "stop.flag" >nul 2>&1
echo  [OK] 서버를 종료했습니다.
exit /b 0
