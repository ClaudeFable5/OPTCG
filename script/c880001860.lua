-- AUTO-GENERATED: ST09-012 / 야마토
-- rules_id=ST09-012 script_id=880001860 fingerprint=e423593d27f64f1b9b30d83d1f76d77e9c76f39d5f5e5498c79f65fa4ba9f4df
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST09-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 다음 자신의 턴 개시 시까지 이 캐릭터의 파워 +2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST09-012]],
    schema_version=1,
  })
end
