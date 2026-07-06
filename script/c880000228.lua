-- AUTO-GENERATED: OP01-105 / 바오황
-- rules_id=OP01-105 script_id=880000228 fingerprint=95e805f09e1f32b9c30416bea2892ccff93302d571d7082a66c376f238fa86b7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-105]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[EXACT]],
            op=[[REVEAL_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 패 2장을 선택해 공개한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-105]],
    schema_version=1,
  })
end
