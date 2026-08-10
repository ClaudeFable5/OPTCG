-- OP14-096 이름 정정: "그라운드 데스" -> "침식 윤회" (유저 하달 2026-08-10).
-- 정본(880002261)과 모든 별쇄(alias=정본)의 name을 함께 맞춘다.
BEGIN TRANSACTION;
UPDATE texts SET name='침식 윤회' WHERE id=880002261 OR id IN (SELECT id FROM datas WHERE alias=880002261);
COMMIT;
