-- ST05-014 부에나 페스타 카운터 +1000 -> +2000 (공식: 코스트1/파워0/카운터+2000; 유저 제보 2026-08-18)
-- 로컬 python sqlite3로 cards-opcg.cdb에 선적용됨(같은 커밋) — 봇 재적용은 멱등.
UPDATE datas SET def=2000 WHERE id=880001796 OR alias=880001796;
