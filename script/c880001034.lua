-- AUTO-GENERATED: OP08-058 / 샬롯 푸딩
-- rules_id=OP08-058 script_id=880001034 fingerprint=472f612190e111984f25ba04ef25e458a878f77e8a170ed19320841cebeb9782
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-058]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            faceup=true,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 라이프 위에서 2장을 앞면으로 할 수 있다: 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-058]],
    schema_version=1,
  })
end
