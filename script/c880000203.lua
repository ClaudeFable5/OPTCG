-- AUTO-GENERATED: OP01-080 / 미스 더블 핑거 (자라)
-- rules_id=OP01-080 script_id=880000203 fingerprint=420a99f2493e9cebb7fc7bdf48372f0b8ad3d01af101123be3118d05782cd677
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-080]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-080]],
    schema_version=1,
  })
end
