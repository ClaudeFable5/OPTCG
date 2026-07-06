-- AUTO-GENERATED: OP06-069 / 빈스모크 레이주
-- rules_id=OP06-069 script_id=880000803 fingerprint=94ae810ee355e191eab616a85409a109d2bffbb9c24a3878df97e4d762a0051e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-069]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=2,
                op=[[DRAW]],
                player=[[YOU]],
              },
            },
            conditions={
              {
                op=[[FIELD_DON_LTE_OPPONENT]],
                player=[[YOU]],
              },
              {
                count=5,
                op=[[HAND_LTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하이고, 자신의 패가 5장 이하인 경우, 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-069]],
    schema_version=1,
  })
end
