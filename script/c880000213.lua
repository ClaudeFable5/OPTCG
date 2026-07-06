-- AUTO-GENERATED: OP01-090 / 바로크 워크스
-- rules_id=OP01-090 script_id=880000213 fingerprint=c6c4246bc7cf998ffc4db331643d59e15d088818f17e291d893209e9c1329faf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-090]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[바로크 워크스]],
              trait=[[바로크 워크스]],
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
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 덱 위에서 5장을 보고 「바로크 워크스」이외의 《바로크 워크스》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-090]],
    schema_version=1,
  })
end
