# cdb 저장소측 갱신 파이프라인

로컬 작업 환경에 sqlite 도구가 없어 cards-opcg.cdb 를 GitHub Actions 러너에서 갱신한다.

## 흐름
1. `pending/` 에 `*.sql` 패치를 커밋해 push 하면 워크플로(`.github/workflows/cdb.yml`)가
   cards-opcg.cdb 에 적용하고 무결성 검사 후 `applied/` 로 옮겨 `[cdb-bot]` 커밋으로 되민다.
2. 매 실행마다 `schema_dump.txt` 에 스키마·표본 행·id 범위를 덤프한다
   (패치 작성 시 열 규약 참조용).

## OP16 코드 배정 (deck_limits.txt 와 동일 스펙)
- 베이스: OP16-001 = 880002558 부터 카드번호 순차 → OP16-119 = 880002676
- 별쇄(인쇄본): 881001662 부터 순차 배정, alias = 베이스 코드
- OP16-042 인펠다운의 죄수 = 880002599 (덱 상한 예외 등록됨)
