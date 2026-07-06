-- AUTO-GENERATED: ST05-006 / 길드 테소로
-- rules_id=ST05-006 script_id=880001788 fingerprint=d40c1d69ad8c90ed52b107d2a785cb45c3fe0adafca0da54324617764092507a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST05-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】두웅!!-2(자신 필드의 두웅!!을 지정된 수 만큼 두웅!! 덱으로 되돌릴 수 있다): 카드를 2장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST05-006]],
    schema_version=1,
  })
end
