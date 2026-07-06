-- AUTO-GENERATED: EB02-032 / 아이스버그
-- rules_id=EB02-032 script_id=880000094 fingerprint=21db350ab4cfb995c67fcf15322a9ef647780d6b8997b4b15a5315431ca67866
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name=[[갈레라 컴퍼니]],
            },
            look_count=7,
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
              name=[[갈레라 컴퍼니]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            count=3,
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!이 3장 이상인 경우, 자신의 덱 위에서 7장을 보고, 「갈레라 컴퍼니」를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌리고, 자신의 패에서 「갈레라 컴퍼니」를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-032]],
    schema_version=1,
  })
end
