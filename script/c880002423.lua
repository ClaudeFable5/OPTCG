-- AUTO-GENERATED: EB04-002 / 쥬얼리 보니
-- rules_id=EB04-002 script_id=880002423 fingerprint=4e34cf904dbed33c15122abeaf7696d01e0634995b869c43bd2421ae9c71038a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[쥬얼리 보니]],
              trait_any={
                [[에그 헤드]],
                [[밀짚모자 일당]],
              },
            },
            look_count=4,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 4장을 보고, 「쥬얼리 보니」 이외의 《에그 헤드》나 《밀짚모자 일당》 특징을 가진 카드 1장까지를 공개하고 패에 넣는다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-002]],
    schema_version=1,
  })
end
