-- AUTO-GENERATED: OP02-091 / 베놈 로드
-- rules_id=OP02-091 script_id=880000336 fingerprint=1c2c7659cd7565d5534c36dc8b9b8aa3556ff37783643a1151c58317756753b5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-091]],
    compile_status=[[AUTO]],
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[RETURN_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=6,
            op=[[FIELD_DON_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대 필드의 두웅!!이 6장 이상인 경우, 상대는 자신 필드의 두웅!! 1장을 두웅!! 덱으로 되돌린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-091]],
    schema_version=1,
  })
end
