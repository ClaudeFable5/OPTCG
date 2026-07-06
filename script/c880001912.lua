-- AUTO-GENERATED: ST13-013 / 몽키 D. 가프
-- rules_id=ST13-013 script_id=880001912 fingerprint=effc091cf209d0ae1701ad2502b0114a6ce6371f929f06f0f83b459826eca2fd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  name=[[사보]],
                },
                {
                  name=[[포트거스 D. 에이스]],
                },
                {
                  name=[[몽키 D. 루피]],
                },
              },
              cost_lte=5,
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
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 코스트 5 이하인 「사보」 또는 「포트거스 D. 에이스」 또는 「몽키 D. 루피」를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST13-013]],
    schema_version=1,
  })
end
