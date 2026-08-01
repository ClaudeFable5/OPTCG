-- AUTO-GENERATED PROMO: P-036 / 몽키 D. 루피
-- rules_id=P-036 script_id=880002487
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 이번 턴 동안, 이 캐릭터와 자신의 리더 1장까지의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-036]],
    schema_version=1,
  })
end
