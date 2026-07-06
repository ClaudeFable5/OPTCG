-- AUTO-GENERATED: ST09-007 / 시노부
-- rules_id=ST09-007 script_id=880001855 fingerprint=36a068622e3a133019d2ff4405e723487ad66d57a36ff5e2b2da875cd1e7c74d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST09-007]],
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
              kind=[[SELF]],
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
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【블록 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 이번 배틀 동안, 이 캐릭터의 파워 +4000.]],
        timings={
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST09-007]],
    schema_version=1,
  })
end
