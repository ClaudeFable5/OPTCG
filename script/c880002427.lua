-- AUTO-GENERATED: EB04-006 / 모다
-- rules_id=EB04-006 script_id=880002427 fingerprint=8854be89e782988e9ea108a4bac43ef74cc5dfb46d49c9769e659235f4267a91
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name=[[루루시아 왕국]],
            },
            look_count=7,
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
        source_text=[[【등장 시】자신의 덱 위에서 7장을 보고, 「루루시아 왕국」 1장까지를 공개하고 패에 넣는다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-006]],
    schema_version=1,
  })
end
