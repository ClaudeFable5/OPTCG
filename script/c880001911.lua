-- AUTO-GENERATED: ST13-012 / 마키노
-- rules_id=ST13-012 script_id=880001911 fingerprint=7224622577dcc2aebb7016a50785e77f880c19f6cd7c9230b4b88238a558ccde
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[LOOK_REORDER_ALL_LIFE]],
            order=[[CHOOSE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 자신의 모든 라이프를 보고, 원하는 순서대로 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST13-012]],
    schema_version=1,
  })
end
