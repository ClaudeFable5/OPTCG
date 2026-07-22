-- AUTO-GENERATED: OP14-042 / 아론
-- rules_id=OP14-042 script_id=880002207 fingerprint=b71ba1de892f2bb40e1ea14e49f78f51d67551d8fe6f5be5d9bf1c2c2bd42893
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-042]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              cost_gte=2,
            },
            look_count=4,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[어인족]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《어인족》 특징을 가진 경우, 덱 위에서 4장을 보고, 코스트 2 이상인 카드 1장까지를 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-042]],
    schema_version=1,
  })
end
