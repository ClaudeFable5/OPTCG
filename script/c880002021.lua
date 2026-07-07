-- AUTO-GENERATED: P-017 / 트라팔가 로
-- rules_id=P-017 script_id=880002021 fingerprint=d19555c11c84fe4c1104ad2d9f694937b1965c0e250622be98c5a8bfb06b7c21
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
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
        source_text=[[【등장 시】이번 턴 동안, 상대 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-017]],
    schema_version=1,
  })
end
