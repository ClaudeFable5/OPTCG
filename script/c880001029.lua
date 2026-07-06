-- AUTO-GENERATED: OP08-053 / 사랑해줘서 ……고마워!!!
-- rules_id=OP08-053 script_id=880001029 fingerprint=48df81d886f3e3f54bec6140cb05013741d3e28337fad2541bc75fff0eee30bc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-053]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  trait_contains=[[흰 수염 해적단]],
                },
                {
                  name=[[몽키 D. 루피]],
                },
              },
            },
            look_count=3,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[흰 수염 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 자신의 덱 위에서 3장을 보고, 『흰 수염 해적단』을 포함한 특징을 가진 카드 또는 「몽키 D. 루피」를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[MAIN]],
        },
      },
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
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-053]],
    schema_version=1,
  })
end
