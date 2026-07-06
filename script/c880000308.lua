-- AUTO-GENERATED: OP02-063 / Mr.1(다즈 보네스)
-- rules_id=OP02-063 script_id=880000308 fingerprint=1c7e4e707d920285277e77a0b49da960c41ad89e7539c06825dd117bb9a79af5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-063]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[EVENT]],
              color=[[BLUE]],
              cost_eq=1,
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 코스트 1인 청색 이벤트를 1장까지 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-063]],
    schema_version=1,
  })
end
