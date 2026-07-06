-- AUTO-GENERATED: ST08-013 / Mr.2 봉쿠레(벤담)
-- rules_id=ST08-013 script_id=880001846 fingerprint=2350a7aa875c3a944b3e07403970ca5538470441a6d069f59ff11f3cac4d5455
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST08-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            mode=[[OPTIONAL]],
            op=[[KO]],
            selector={
              count=1,
              kind=[[EVENT_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
          },
          {
            op=[[KO]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터가 상대의 캐릭터와 배틀한 배틀 종료 시, 배틀한 상대의 캐릭터를 KO 시킬 수 있다. 이 경우, 이 캐릭터를 KO 시킨다.]],
        timings={
          [[AFTER_BATTLE_WITH_OPPONENT_CHARACTER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST08-013]],
    schema_version=1,
  })
end
