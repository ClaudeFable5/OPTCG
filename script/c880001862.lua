-- AUTO-GENERATED: ST09-014 / 우는살
-- rules_id=ST09-014 script_id=880001862 fingerprint=2cc42f2721c5008303b89c291fe6e5edbee681776140321da669fc23936abd6d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST09-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 라이프가 2장 이하인 경우, 이번 턴 동안, 상대의 리더 또는 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 패 2장을 버릴 수 있다: 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST09-014]],
    schema_version=1,
  })
end
