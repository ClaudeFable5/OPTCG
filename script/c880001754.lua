-- AUTO-GENERATED: ST03-007 / 센토마루
-- rules_id=ST03-007 script_id=880001754 fingerprint=85578bf3fe9d8907c5832b1fecebe43108a6e271ba6572b82b75eac5ec4f97b7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST03-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=4,
              name=[[파시피스타]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_DECK]],
            player=[[YOU]],
            rested=false,
          },
          {
            op=[[SHUFFLE_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】 【기동: 메인】 【턴 1회】2 (코스트 에리어의 두웅!!을 지정된 수만큼 레스트 할 수 있다): 자신의 덱에서 코스트 4 이하인 「파시피스타」를 1장까지 등장시키고 덱을 섞는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST03-007]],
    schema_version=1,
  })
end
