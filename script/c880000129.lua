-- AUTO-GENERATED: OP01-006 / 오타마
-- rules_id=OP01-006 script_id=880000129 fingerprint=ce977c274c10d0acf51333a9e58c715201e2ab70cd1cdf0d44ba7b5a0526a662
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
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
        source_text=[[【등장 시】 이번 턴 동안, 상대 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-006]],
    schema_version=1,
  })
end
