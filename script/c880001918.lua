-- AUTO-GENERATED: ST13-019 / 3형제의 유대
-- rules_id=ST13-019 script_id=880001918 fingerprint=d570c80949d6bdfa52982b4adba84ae12c7647ad06960f18dfb08c9dd197cff0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-019]],
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
        source_text=[[【메인】자신의 덱 위에서 5장을 보고 코스트 5 이하인 「사보」 또는 「포트거스 D. 에이스」 또는 「몽키 D. 루피」를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【메인】효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST13-019]],
    schema_version=1,
  })
end
