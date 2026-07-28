-- AUTO-GENERATED: OP15-043 / 켈리 펑크
-- rules_id=OP15-043 script_id=880002345 fingerprint=1f77342cd34ba0e121c0bafaf0c072f75fac634a48eb3a7b3b1254da88305d16
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-043]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              name=[[바비 펑크]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 「바비 펑크」 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-043]],
    schema_version=1,
  })
end
