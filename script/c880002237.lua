-- AUTO-GENERATED: OP14-072 / 베이비 5
-- rules_id=OP14-072 script_id=880002237 fingerprint=eb9f010a3c3e0cdbb4c266631b6213fe5e8aa16aa647f7968ab2476b01638565
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-072]],
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
        source_text=[[【등장 시】두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】두웅!!-1: 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-072]],
    schema_version=1,
  })
end
