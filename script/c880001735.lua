-- AUTO-GENERATED: ST02-007 / 쥬얼리 보니
-- rules_id=ST02-007 script_id=880001735 fingerprint=092a865b1a0791f4db4889c37d35cfbfaf5aa4958f5fb60900b1d97af179cad5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST02-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[초신성]],
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
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트 할 수 있다), 이 캐릭터를 레스트 할 수 있다: 자신의 덱 위에서 5장을 보고, 《초신성》 특징을 가진 카드를 1장까지 공개하여 패에 더한다. 그 후, 남은 카드는 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST02-007]],
    schema_version=1,
  })
end
