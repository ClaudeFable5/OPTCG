-- AUTO-GENERATED: OP04-012 / 네펠타리 코브라
-- rules_id=OP04-012 script_id=880000502 fingerprint=db4e229d7c840fd31ffcae8822896c7909d75bcc4b0f20a1a0c12f6c8407b66e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                exclude_self=true,
                trait=[[알라바스타 왕국]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】이 캐릭터 이외의 자신의 《알라바스타 왕국》 특징을 가진 모든 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-012]],
    schema_version=1,
  })
end
