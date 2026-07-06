-- AUTO-GENERATED: OP08-051 / 버킨
-- rules_id=OP08-051 script_id=880001027 fingerprint=cda2665a910a1859d8a14ab48024a06225b003f21805ab66d0dfc6a71a2f43a7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-051]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name=[[에드워드 위블]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】이번 턴 동안, 자신의 「에드워드 위블」 1장까지의 파워 +2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-051]],
    schema_version=1,
  })
end
