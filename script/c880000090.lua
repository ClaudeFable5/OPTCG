-- AUTO-GENERATED: EB02-028 / 포트거스 D. 에이스
-- rules_id=EB02-028@49052d405bf2 script_id=880000090 fingerprint=49052d405bf233f441339c8d26336e69ec5d3465aaa60d13a33610904da7633e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              cost_eq=2,
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=2,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=true,
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
        source_text=[[【등장 시】자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 자신의 덱 위에서 5장을 보고, 코스트 2인 캐릭터 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌리고, 자신의 패에서 코스트 2인 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-028@49052d405bf2]],
    schema_version=1,
  })
end
