-- AUTO-GENERATED: EB02-036 / 니코 로빈
-- rules_id=EB02-036 script_id=880000098 fingerprint=72a56baaa173fac9a9ac6ea4b02129adeeca28b583d788aa66bb9d2ab85f3d82
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[밀짚모자 일당]],
            },
            look_count=3,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】두웅!!-1: 자신의 덱 위에서 3장을 보고, 《밀짚모자 일당》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB02-036]],
    schema_version=1,
  })
end
