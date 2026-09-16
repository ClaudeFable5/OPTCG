# deploy-now — OPTCG 게임 서버(Multiroptcg) 설치·실행기

`deploy-now.bat` 하나를 원하는 폴더(예: `C:\Users\xnaud\Downloads\TalkFile_deploy-now`)에 넣고
**더블클릭**하면 그 폴더에 Multirole 서버(OPTCG 전용 포크 Multiroptcg)를 설치하고 바로 띄운다.
창을 닫으면 서버도 꺼진다.

## 하는 일

1. **바이너리 확보** — 폴더에 `multirole.exe`·`hornet.exe`가 없으면
   `Multiroptcg-win32.zip`(폴더에 있으면 그것, 없으면 릴리스
   [server-win32](https://github.com/ClaudeFable5/OPTCG/releases/tag/server-win32)에서 다운로드)을 풀어 넣는다.
   `.sha256`으로 체크섬을 검증한다.
2. **config.json 생성** — 없을 때만. 카드 데이터 원본은 `https://github.com/ClaudeFable5/OPTCG.git`
   (script/, cards-opcg.cdb, ocgcore.dll, lflists/). 이미 있으면 손대지 않으므로 마음껏 고쳐도 된다.
3. **방화벽 규칙** — 인바운드 TCP 7911(듀얼)·7922(방 목록). 관리자 권한이 필요해서 UAC 창이 한 번 뜬다
   (거절해도 서버는 뜨지만 외부 접속이 막힐 수 있음).
4. **실행 루프** — `multirole.exe`를 띄우고, 죽으면 3초 뒤 다시 띄운다. 시작 직후 3번 연속 죽으면 멈추고 로그를 보여준다.

첫 실행은 GitHub에서 카드 데이터 저장소를 통째로 클론하느라 몇 분 걸린다. 그 뒤로는 켤 때마다 fetch + reset으로 최신화.

## 명령

| 명령 | 동작 |
| --- | --- |
| `deploy-now.bat` | 설치(없는 것만) + 실행 |
| `deploy-now.bat install` | 설치만 |
| `deploy-now.bat run` | 실행만 |
| `deploy-now.bat reload` | 켜져 있는 서버에 카드 데이터 즉시 갱신(웹훅 34343, 토큰 `optcg-drop-apply`) |
| `deploy-now.bat stop` | 서버 종료 |
| `deploy-now.bat firewall` | 방화벽 규칙만 등록(관리자 권한 프롬프트에서) |

## 접속 정보

- 클라이언트(`config/configs.json` servers) : `address` = 서버 PC 공인 IP, `duelport` = **7911**, `roomlistport` = **7922**
- 공유기 뒤라면 TCP 7911·7922 포트포워딩 필요. 배치가 켜질 때 내부 IP와 공인 IP를 찍어 준다.
- 동작 확인: 서버 PC에서 브라우저로 `http://127.0.0.1:7922/` → `{"rooms":[]}`

## 서버 바이너리는 어디서 오나

`.github/workflows/server-win32.yml`이 [ClaudeFable5/Multiroptcg](https://github.com/ClaudeFable5/Multiroptcg)
(master)를 MSYS2 mingw32로 **32비트** 빌드해 릴리스 `server-win32`의 `Multiroptcg-win32.zip`을 갱신한다.
(카드 데이터 저장소의 `ocgcore.dll`이 Win32라 hornet.exe도 32비트여야 적재된다.)

- Actions 탭 → **server-win32** → *Run workflow* 로 언제든 다시 빌드(포크 ref 지정 가능).
- `main`에 이 워크플로우나 `tools/deploy-now/`가 바뀌어 푸시돼도 자동 실행.
- MSYS2가 32비트 boost 패키지를 끊어서, boost는 upstream DyXel/Multirole(고정 커밋)의
  `.github/mingw-w64-boost` PKGBUILD로 직접 빌드한다.
- 워크플로우는 릴리스에 올리기 전에 Windows 러너에서 배치 파일을 실제로 실행해(설치 → 기동 → 데이터 클론 →
  코어 적재 → 7922 응답 → reload → stop) 검증한다.

MSVC로 직접 빌드한 `multirole.exe`/`hornet.exe`를 쓰고 싶으면 폴더에 넣어 두면 그걸 그대로 쓴다
(OpenSSL 기반 빌드는 `cacert.pem`을 같은 폴더에 두면 배치가 `SSL_CERT_FILE`로 넘겨 준다).

## 문제 해결

- **SmartScreen / "Windows의 PC 보호"** — 서명 없는 파일이라 뜰 수 있다. *추가 정보 → 실행*.
- **다운로드 실패** — 인터넷을 확인하거나 릴리스 페이지에서 `Multiroptcg-win32.zip`을 받아 폴더에 넣고 다시 실행.
- **포트 사용 중** — 서버가 시작 직후 계속 죽으면 7911/7922/34343을 다른 프로그램이 쓰고 있는지 확인.
- **카드 데이터가 안 바뀜** — 서버는 켜질 때와 `reload` 때만 GitHub을 본다. `deploy-now.bat reload` 또는 재시작.
- **카카오톡으로 보낼 때** — `.bat`·`.exe`는 카카오톡이 전송을 막는다. zip으로 묶어서 보낼 것.
