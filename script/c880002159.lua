-- AUTO-GENERATED: EB03-056 / 벨로 베티
-- rules_id=EB03-056 script_id=880002159 fingerprint=ff12bb8830bf0b247c72357795d5a55d9199b1eb29cd9fa987cdcfc0946057da
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-056]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            faceup=true,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위에서 1장을 앞면으로 할 수 있다: 상대의 원래 코스트 3 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-056]],
    schema_version=1,
  })
end
