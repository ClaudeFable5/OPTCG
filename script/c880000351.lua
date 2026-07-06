-- AUTO-GENERATED: OP02-106 / 츠루
-- rules_id=OP02-106 script_id=880000351 fingerprint=620e21d872b2f99ad77b4ecb9d6ac0a5d7253e25e062eb269a9b444cc3c26040
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-106]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -2.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-106]],
    schema_version=1,
  })
end
