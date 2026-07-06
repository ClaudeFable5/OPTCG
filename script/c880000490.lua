-- AUTO-GENERATED: OP03-123 / 샬롯 카타쿠리
-- rules_id=OP03-123 script_id=880000490 fingerprint=df6668c068590401841b467ceb81f891774cf99804ac1b86bf0159e87bc159a0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-123]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            faceup=true,
            op=[[ADD_TO_OWNER_LIFE]],
            positions={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            selector={
              count=1,
              filter={
                cost_lte=8,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】코스트 8 이하인 캐릭터를 1장까지 주인의 라이프 맨 위나 아래에 앞면으로 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-123]],
    schema_version=1,
  })
end
