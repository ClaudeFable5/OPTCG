-- AUTO-GENERATED: OP11-030 / 시라호시
-- rules_id=OP11-030 script_id=880001364 fingerprint=aff083a8f4f8f55784f45ab8c17ae0be223f4ef50f0650bdedec17ce601dab2a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-030]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait_any={
                [[해왕류]],
                [[어인섬]],
              },
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
        source_text=[[【기동: 메인】자신의 두웅!! 1장과 이 캐릭터를 레스트할 수 있다: 자신의 덱 위에서 5장을 보고, 《해왕류》 또는 《어인섬》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-030]],
    schema_version=1,
  })
end
