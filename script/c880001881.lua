-- AUTO-GENERATED: ST11-004 / 신시대
-- rules_id=ST11-004 script_id=880001881 fingerprint=3879dd41f1f0a2a16be8b33b37c75ee2fbcce91a95da8e44b6471645475cd651
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST11-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[신시대]],
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
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            name=[[우타]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 리더가 「우타」인 경우, 자신의 덱 위에서 3장을 보고, 「신시대」 이외의 《FILM》 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌리고, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST11-004]],
    schema_version=1,
  })
end
