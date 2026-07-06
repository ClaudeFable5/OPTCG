-- AUTO-GENERATED: ST13-006 / 컬리 다단
-- rules_id=ST13-006 script_id=880001905 fingerprint=916a0e6d701279e19145317cd18e5a1b3bd17d4821bda93ac15faf7d346b19f6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=2,
              name=[[사보]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=2,
              name=[[포트거스 D. 에이스]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=2,
              name=[[몽키 D. 루피]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 코스트 2인 「사보」와 「포트거스 D. 에이스」와 「몽키 D. 루피」를 각각 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST13-006]],
    schema_version=1,
  })
end
