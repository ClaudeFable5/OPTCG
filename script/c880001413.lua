-- AUTO-GENERATED: OP11-079 / 사내의 승부에…!!! 얄팍하기 짝이 없는 도움 따위 집어쳐라!!!
-- rules_id=OP11-079 script_id=880001413 fingerprint=d6842b1bb7707d6dfe6200e2d6cda73732e0fd9cbd619c8864c8aa653869c837
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-079]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            on_match={
              {
                amount=5000,
                duration=[[THIS_BATTLE]],
                op=[[MODIFY_POWER]],
                selector={
                  count=1,
                  kind=[[LEADER_OR_CHARACTER]],
                  mode=[[UP_TO]],
                  owner=[[YOU]],
                },
              },
            },
            op=[[DECLARE_COST_REVEAL]],
            player=[[YOU]],
            reveal_player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】임의의 코스트를 선언하고, 상대의 덱 위에서 1장을 공개한다. 공개한 카드가 선언한 코스트와 같은 경우, 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +5000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-079]],
    schema_version=1,
  })
end
