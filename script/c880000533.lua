-- AUTO-GENERATED: OP04-042 / 잇폰마츠
-- rules_id=OP04-042 script_id=880000533 fingerprint=e5661358fc44f23d4d3bdfba14de06316e080df7287d7af9579b83eda243678d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-042]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                attribute=[[SLASH]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=1,
            op=[[MILL_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 <참격> 속성을 가진 캐릭터 1장까지의 파워 +3000. 그 후, 자신의 덱 위에서 1장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-042]],
    schema_version=1,
  })
end
