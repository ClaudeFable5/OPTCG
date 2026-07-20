-- AUTO-GENERATED: EB03-009 / 마키노
-- rules_id=EB03-009 script_id=880002112 fingerprint=2eb1a768227a2fbae80f40a9f11fa49439a016dac481dd620623d57d1eb29e26
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                vanilla=true,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 이번 턴 동안, 자신의 원래 효과가 없는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-009]],
    schema_version=1,
  })
end
