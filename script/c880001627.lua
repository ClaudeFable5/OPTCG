-- AUTO-GENERATED: OP13-055 / 라쿠요
-- rules_id=OP13-055 script_id=880001627 fingerprint=ec0af01bf818639685a3aa058077f943d491708fee8606f3a15414be412de8d8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                trait_contains=[[흰 수염 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=4,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패가 4장 이하인 경우, 이번 턴 동안, 자신의 『흰 수염 해적단』을 포함한 특징을 가진 모든 캐릭터의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-055]],
    schema_version=1,
  })
end
