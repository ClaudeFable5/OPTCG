-- AUTO-GENERATED: ST29-013 / 로브 루치
-- rules_id=ST29-013 script_id=880002298 fingerprint=76fac3089078ed7d095271d6d98563671d1fc45bcc7ae19629c9e66e7a9cf79d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte_life_total=true,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】서로의 라이프 합계 매수 이하의 코스트를 가진 상대 캐릭터 1장까지를 KO한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST29-013]],
    schema_version=1,
  })
end
