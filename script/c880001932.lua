-- AUTO-GENERATED: ST14-014 / 고무고무 거인의 라이플
-- rules_id=ST14-014 script_id=880001932 fingerprint=e82c1c9623e6233890540b5fc026ee4f0306dceec4a69a8e7c0721f48633278f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST14-014]],
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
        },
        conditions={
          {
            filter={
              cost_gte=8,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[ANY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】코스트 8 이상인 캐릭터가 있을 경우, 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              cost_lte=2,
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 트래시에서 코스트 2 이하인 캐릭터 카드를 1장까지 패에 더한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST14-014]],
    schema_version=1,
  })
end
