-- AUTO-GENERATED: ST02-015 / 메스
-- rules_id=ST02-015 script_id=880001744 fingerprint=6ab54b4888295056ce2b7959adbc0e938a0574f8bb734436e93283bfc1c5c35c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST02-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
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
        source_text=[[【카운터】이번 배틀 중, 자신의 리더 또는 캐릭터 1까지의 파워 +2000. 그 후, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST02-015]],
    schema_version=1,
  })
end
