-- AUTO-GENERATED: ST02-016 / 리펠
-- rules_id=ST02-016 script_id=880001745 fingerprint=c779764b6d920cd6892acea1e2c05571d777b8201e0ae9d13ebd8f7d55a56b7c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST02-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=4000,
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
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 중, 자신의 리더 또는 캐릭터 1장까지의 파워 +4000. 그 후, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST02-016]],
    schema_version=1,
  })
end
