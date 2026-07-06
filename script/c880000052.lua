-- AUTO-GENERATED: EB01-053 / 가스티노
-- rules_id=EB01-053 script_id=880000052 fingerprint=d6a3c77cb771501c0c3ef6be017fb1f468221ef52a02fffa4468a385f991f9ad
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-053]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            faceup=true,
            op=[[ADD_TO_LIFE]],
            player=[[OPPONENT]],
            positions={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
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
        source_text=[[【등장 시】상대의 코스트 3 이하인 캐릭터를 1장까지 상대의 라이프 맨 위나 아래에 앞면으로 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=2,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이번 턴 동안, 상대의 리더 또는 캐릭터 합계 2장까지의 파워 -3000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-053]],
    schema_version=1,
  })
end
