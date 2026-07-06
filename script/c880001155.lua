-- AUTO-GENERATED: OP09-059 / 수증기 살인사건
-- rules_id=OP09-059 script_id=880001155 fingerprint=fc90b3be8522ca64f6f838abe8e34096627edf03e456280aef73ddb846bd00e4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-059]],
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
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=2,
            mode=[[UP_TO]],
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
          {
            count_from_event=true,
            op=[[MILL_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +3000. 그 후, 자신의 패를 2장까지 버린다. 버린 수와 같은 수를 자신의 덱 맨 위부터 트래시에 놓는다.]],
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
    rules_id=[[OP09-059]],
    schema_version=1,
  })
end
