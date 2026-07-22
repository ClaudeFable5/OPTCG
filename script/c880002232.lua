-- AUTO-GENERATED: OP14-067 / 델린저
-- rules_id=OP14-067 script_id=880002232 fingerprint=d0c81260218b29f28239e725f76e865f3242410ea218ac09556a75d9e723b69a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-067]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
          {
            destination=[[HAND]],
            filter={
              trait=[[돈키호테 해적단]],
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가하고, 자신의 덱 위에서 5장을 보고, 《돈키호테 해적단》 특징을 가진 카드 1장까지를 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-067]],
    schema_version=1,
  })
end
