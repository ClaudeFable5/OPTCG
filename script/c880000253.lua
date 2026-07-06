-- AUTO-GENERATED: OP02-009 / 스쿼드
-- rules_id=OP02-009 script_id=880000253 fingerprint=a62ef68355c0a945146e6c16922ffc63cf9c2ebd90171ed7d79e3d8eeb95dab5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-4000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[흰 수염 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -4000 하고, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-009]],
    schema_version=1,
  })
end
