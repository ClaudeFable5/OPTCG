-- AUTO-GENERATED: OP08-092 / 페이지 원
-- rules_id=OP08-092 script_id=880001068 fingerprint=cb33b6d0d6c7ff5b8663872d71174e542a68a28f5d1b972b67a82544458129d7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-092]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=4,
              name=[[울티]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 코스트 4 이하인 「울티」를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-092]],
    schema_version=1,
  })
end
