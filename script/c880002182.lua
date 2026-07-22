-- AUTO-GENERATED: OP14-017 / 샴블즈
-- rules_id=OP14-017 script_id=880002182 fingerprint=9170d66b0918b35062566ea5062f47b23e3598f07c0cc11fb2d07dd236b734f4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[SWAP_BASE_POWER]],
            selector={
              count=2,
              filter={
                base_power_lte=9000,
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】상대의 원래 파워가 9000 이하인 캐릭터 2장을 고른다. 고른 캐릭터 각각의 원래 파워를, 이번 턴 동안, 맞바꾼다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-017]],
    schema_version=1,
  })
end
