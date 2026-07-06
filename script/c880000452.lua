-- AUTO-GENERATED: OP03-086 / 스팬담
-- rules_id=OP03-086 script_id=880000452 fingerprint=3fc4869a85e1c646cb2fd1a1bfe0c34e58b683b8df10ea4fc4e30a5a4588280e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-086]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[스팬담]],
              trait_contains=[[CP]],
            },
            look_count=3,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[TRASH]],
            rest_order=[[KEEP]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[CP]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 『CP』를 포함한 특징을 가진 경우, 덱 위에서 3장을 보고, 「스팬담」 이외의 『CP』를 포함한 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-086]],
    schema_version=1,
  })
end
