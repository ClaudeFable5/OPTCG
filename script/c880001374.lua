-- AUTO-GENERATED: OP11-040 / 몽키 D. 루피
-- rules_id=OP11-040 script_id=880001374 fingerprint=25fb1f048f3cfbb9ecf4be1c3eebf61fd203224e703515f4c2f641b566fbc20f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-040]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[밀짚모자 일당]],
            },
            look_count=5,
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
            count=8,
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 턴 개시 시, 발동할 수 있다. 자신 필드의 두웅!!이 8장 이상인 경우, 자신의 덱 위에서 5장을 보고, 《밀짚모자 일당》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[YOUR_TURN_START]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-040]],
    schema_version=1,
  })
end
