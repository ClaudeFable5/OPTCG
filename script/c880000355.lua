-- AUTO-GENERATED: OP02-110 / 히나
-- rules_id=OP02-110 script_id=880000355 fingerprint=7d142de0059cb8d3343c9e8ed0dcae745bc649313bc66cec8a74233f7e507d3c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-110]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_ATTACK]],
            selector={
              count=1,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【블록 시】상대의 코스트 6 이하인 캐릭터를 1장까지 선택한다. 이번 턴 동안, 선택된 캐릭터는 어택할 수 없다.]],
        timings={
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP02-110]],
    schema_version=1,
  })
end
