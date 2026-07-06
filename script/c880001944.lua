-- AUTO-GENERATED: ST21-004 / 쥬얼리 보니
-- rules_id=ST21-004 script_id=880001944 fingerprint=34b1742166a538f64f4fd424c45ffb77ad08d63ba30638850fb5a31bdb1707a6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST21-004]],
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
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[ST21-004]],
    schema_version=1,
  })
end
