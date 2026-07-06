-- AUTO-GENERATED: OP02-036 / 나미
-- rules_id=OP02-036 script_id=880000280 fingerprint=88b5d0309316bf9e12443ae386910d0575d8952e6b56283c1fbc95e56c06ab30
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[나미]],
              trait=[[FILM]],
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
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】➀(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 자신의 덱 위에서 3장을 보고, 「나미」 이외의 《FILM》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.`]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-036]],
    schema_version=1,
  })
end
