-- MANUAL: ST10-002 / 몽키 D. 루피 (2026-07-15 누락 보충 — ST10 리더 3장)
-- rules_id=ST10-002 script_id=880002102
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST10-002]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={
          {
            eq=0,
            gte=8,
            op=[[FIELD_DON_EQ_OR_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 필드의 돈!!이 0장이거나 8장 이상인 경우, 돈!!덱에서 돈!! 1장까지를 액티브로 추가한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST10-002]],
    schema_version=1,
  })
end
