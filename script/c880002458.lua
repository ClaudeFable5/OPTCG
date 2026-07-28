-- AUTO-GENERATED: EB04-037 / 포르체
-- rules_id=EB04-037 script_id=880002458 fingerprint=049d6da6354a403be32bb5471de71046efc5dade825783816b66db4488ab65c6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-037]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[폭시 해적단]],
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[폭시 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《폭시 해적단》 특징을 가진 경우, 자신의 덱 위에서 5장을 보고, 《폭시 해적단》 특징을 가진 카드 1장까지를 공개하고 패에 넣는다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-037]],
    schema_version=1,
  })
end
