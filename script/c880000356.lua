-- AUTO-GENERATED: OP02-111 / 풀보디
-- rules_id=OP02-111 script_id=880000356 fingerprint=9000d103dc3ab7b260ca9e7e0afddb7e285abff617c7514a17f13935afb038b0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-111]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              name=[[쟝고]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 「쟝고」가 있을 경우, 이번 배틀 동안, 이 카드의 파워 +3000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-111]],
    schema_version=1,
  })
end
