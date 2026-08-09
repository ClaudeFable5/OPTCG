-- 중복 베이스 코드 정리(비파괴 UPDATE 전용): 같은 카드번호 = 같은 카드.
-- 텍스트는 정본(최신 코드) 본문으로 통일(각 행의 [번호] 헤더와 '패러렐' 꼬리는 보존),
-- alias는 정본으로 병합해 덱 매수 합산·정본/별쇄 구분을 정확히 한다.
BEGIN TRANSACTION;
-- EB01-057: 정본 880000057 <- 구판 880000056
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000057), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000057), instr((SELECT desc FROM texts WHERE id=880000057),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000056) OR id IN (SELECT id FROM datas WHERE alias IN (880000056));
UPDATE datas SET alias=880000057 WHERE alias IN (880000056);
UPDATE datas SET alias=880000057 WHERE id IN (880000056);
-- EB02-028: 정본 880000090 <- 구판 880000089
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000090), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000090), instr((SELECT desc FROM texts WHERE id=880000090),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000089) OR id IN (SELECT id FROM datas WHERE alias IN (880000089));
UPDATE datas SET alias=880000090 WHERE alias IN (880000089);
UPDATE datas SET alias=880000090 WHERE id IN (880000089);
-- OP02-040: 정본 880000285 <- 구판 880000284
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000285), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000285), instr((SELECT desc FROM texts WHERE id=880000285),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000284) OR id IN (SELECT id FROM datas WHERE alias IN (880000284));
UPDATE datas SET alias=880000285 WHERE alias IN (880000284);
UPDATE datas SET alias=880000285 WHERE id IN (880000284);
-- OP03-114: 정본 880000481 <- 구판 880000480
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000481), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000481), instr((SELECT desc FROM texts WHERE id=880000481),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000480) OR id IN (SELECT id FROM datas WHERE alias IN (880000480));
UPDATE datas SET alias=880000481 WHERE alias IN (880000480);
UPDATE datas SET alias=880000481 WHERE id IN (880000480);
-- OP04-024: 정본 880000515 <- 구판 880000514
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000515), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000515), instr((SELECT desc FROM texts WHERE id=880000515),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000514) OR id IN (SELECT id FROM datas WHERE alias IN (880000514));
UPDATE datas SET alias=880000515 WHERE alias IN (880000514);
UPDATE datas SET alias=880000515 WHERE id IN (880000514);
-- OP04-044: 정본 880000536 <- 구판 880000535
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000536), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000536), instr((SELECT desc FROM texts WHERE id=880000536),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000535) OR id IN (SELECT id FROM datas WHERE alias IN (880000535));
UPDATE datas SET alias=880000536 WHERE alias IN (880000535);
UPDATE datas SET alias=880000536 WHERE id IN (880000535);
-- OP05-001: 정본 880000613 <- 구판 880000612
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000613), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000613), instr((SELECT desc FROM texts WHERE id=880000613),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000612) OR id IN (SELECT id FROM datas WHERE alias IN (880000612));
UPDATE datas SET alias=880000613 WHERE alias IN (880000612);
UPDATE datas SET alias=880000613 WHERE id IN (880000612);
-- OP05-066: 정본 880000679 <- 구판 880000678
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000679), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000679), instr((SELECT desc FROM texts WHERE id=880000679),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000678) OR id IN (SELECT id FROM datas WHERE alias IN (880000678));
UPDATE datas SET alias=880000679 WHERE alias IN (880000678);
UPDATE datas SET alias=880000679 WHERE id IN (880000678);
-- OP05-119: 정본 880000734 <- 구판 880000732 880000733
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000734), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000734), instr((SELECT desc FROM texts WHERE id=880000734),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000732,880000733) OR id IN (SELECT id FROM datas WHERE alias IN (880000732,880000733));
UPDATE datas SET alias=880000734 WHERE alias IN (880000732,880000733);
UPDATE datas SET alias=880000734 WHERE id IN (880000732,880000733);
-- OP07-019: 정본 880000873 <- 구판 880000872
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000873), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000873), instr((SELECT desc FROM texts WHERE id=880000873),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000872) OR id IN (SELECT id FROM datas WHERE alias IN (880000872));
UPDATE datas SET alias=880000873 WHERE alias IN (880000872);
UPDATE datas SET alias=880000873 WHERE id IN (880000872);
-- OP07-033: 정본 880000888 <- 구판 880000887
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000888), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000888), instr((SELECT desc FROM texts WHERE id=880000888),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000887) OR id IN (SELECT id FROM datas WHERE alias IN (880000887));
UPDATE datas SET alias=880000888 WHERE alias IN (880000887);
UPDATE datas SET alias=880000888 WHERE id IN (880000887);
-- OP07-111: 정본 880000967 <- 구판 880000966
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000967), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000967), instr((SELECT desc FROM texts WHERE id=880000967),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000966) OR id IN (SELECT id FROM datas WHERE alias IN (880000966));
UPDATE datas SET alias=880000967 WHERE alias IN (880000966);
UPDATE datas SET alias=880000967 WHERE id IN (880000966);
-- OP07-118: 정본 880000975 <- 구판 880000974
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880000975), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880000975), instr((SELECT desc FROM texts WHERE id=880000975),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880000974) OR id IN (SELECT id FROM datas WHERE alias IN (880000974));
UPDATE datas SET alias=880000975 WHERE alias IN (880000974);
UPDATE datas SET alias=880000975 WHERE id IN (880000974);
-- OP09-035: 정본 880001131 <- 구판 880001130
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880001131), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880001131), instr((SELECT desc FROM texts WHERE id=880001131),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880001130) OR id IN (SELECT id FROM datas WHERE alias IN (880001130));
UPDATE datas SET alias=880001131 WHERE alias IN (880001130);
UPDATE datas SET alias=880001131 WHERE id IN (880001130);
-- ST01-002: 정본 880001712 <- 구판 880001711
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880001712), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880001712), instr((SELECT desc FROM texts WHERE id=880001712),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880001711) OR id IN (SELECT id FROM datas WHERE alias IN (880001711));
UPDATE datas SET alias=880001712 WHERE alias IN (880001711);
UPDATE datas SET alias=880001712 WHERE id IN (880001711);
-- ST01-005: 정본 880001716 <- 구판 880001715
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880001716), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880001716), instr((SELECT desc FROM texts WHERE id=880001716),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880001715) OR id IN (SELECT id FROM datas WHERE alias IN (880001715));
UPDATE datas SET alias=880001716 WHERE alias IN (880001715);
UPDATE datas SET alias=880001716 WHERE id IN (880001715);
-- ST02-007: 정본 880001736 <- 구판 880001735
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880001736), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880001736), instr((SELECT desc FROM texts WHERE id=880001736),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880001735) OR id IN (SELECT id FROM datas WHERE alias IN (880001735));
UPDATE datas SET alias=880001736 WHERE alias IN (880001735);
UPDATE datas SET alias=880001736 WHERE id IN (880001735);
-- ST03-004: 정본 880001751 <- 구판 880001750
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880001751), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880001751), instr((SELECT desc FROM texts WHERE id=880001751),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880001750) OR id IN (SELECT id FROM datas WHERE alias IN (880001750));
UPDATE datas SET alias=880001751 WHERE alias IN (880001750);
UPDATE datas SET alias=880001751 WHERE id IN (880001750);
-- ST04-005: 정본 880001770 <- 구판 880001769
UPDATE texts SET name=(SELECT name FROM texts WHERE id=880001770), desc = substr(desc,1,instr(desc,']')) || char(10)||char(10) || substr((SELECT desc FROM texts WHERE id=880001770), instr((SELECT desc FROM texts WHERE id=880001770),']')+3) || CASE WHEN instr(desc,'패러렐')=0 THEN '' ELSE char(10)||char(10)||substr(desc, instr(desc,'패러렐')) END WHERE id IN (880001769) OR id IN (SELECT id FROM datas WHERE alias IN (880001769));
UPDATE datas SET alias=880001770 WHERE alias IN (880001769);
UPDATE datas SET alias=880001770 WHERE id IN (880001769);
-- OP04-044 카이도: 공격 속성 타격(STRIKE=1) 통일 - 본체 전 판본 + 인쇄본
UPDATE datas SET category=1 WHERE id IN (880000535,880000536) OR alias IN (880000535,880000536);
COMMIT;
