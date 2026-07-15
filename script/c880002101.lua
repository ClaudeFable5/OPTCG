-- MANUAL: ST10-001 / 트라팔가 로 (2026-07-15 누락 보충 — ST10 리더 3장이
-- JP 병합에서 통째로 빠진 것을 전수 대조로 발견, 수동 이식)
-- rules_id=ST10-001 script_id=880002101
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST10-001]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                power_lte=3000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】돈!!-3(자신의 필드의 돈!!을 지정된 수만큼 돈!!덱으로 되돌린다): 상대의 파워 3000 이하의 캐릭터 1장까지를 주인의 덱 맨 아래에 놓는다. 그 후, 자신의 패에서 코스트 4 이하의 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST10-001]],
    schema_version=1,
  })
end
