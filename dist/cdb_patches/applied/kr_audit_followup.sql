-- 한국 공홈 전수 대조 후속(2026-08-19): OP13-079 이무→임, 파워0 표기 3장(-2→0: P-079/P-096/ST16-002), P-062 속성(참격/타격) 보강
-- 로컬 python sqlite3로 선적용됨(같은 커밋) — 봇 재적용은 멱등.
UPDATE texts SET name='임' WHERE id=880001651;
UPDATE texts SET name='임' WHERE id=881000491;
UPDATE datas SET atk=0 WHERE id=880002062;
UPDATE datas SET atk=0 WHERE id=881001573;
UPDATE datas SET atk=0 WHERE id=880002068;
UPDATE datas SET atk=0 WHERE id=880002080;
UPDATE datas SET category=3 WHERE id=880002056;
