-- AUTO-GENERATED: ST02-009 / 트라팔가 로
-- rules_id=ST02-009 script_id=880001738 fingerprint=f068120167ae9851fc35ed8a291b9a62a58e2e7c48f1cbcbc4150146d86ec693
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST02-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=5,
                state=[[RESTED]],
                trait_any={
                  [[초신성]],
                  [[하트 해적단]],
                },
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 레스트 상태인 코스트 5이하의 《초신성》 또는 《하트 해적단》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST02-009]],
    schema_version=1,
  })
end
