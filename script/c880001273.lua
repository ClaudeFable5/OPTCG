-- AUTO-GENERATED: OP10-058 / 레베카
-- rules_id=OP10-058 script_id=880001273 fingerprint=851d547e7ab5b5f92e0ce2c1989fbc2ddcf5940d3abb3fd104b86d31a870d49e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-058]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            active_count=1,
            count=2,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=7,
              name_neq=[[레베카]],
              trait=[[드레스로자]],
            },
            op=[[REVEAL_PLAY_SPLIT_FROM_HAND]],
            player=[[YOU]],
            rested_filter={
              cost_lte=4,
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            filter={
              cost_gte=8,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[ANY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】코스트 8 이상인 캐릭터가 있을 경우, 카드를 1장 뽑는다. 그 후, 자신의 패에서 「레베카」 이외의 《드레스로자》 특징을 가진 코스트 7 이하인 캐릭터 카드를 2장까지 공개한다. 공개한 카드 중 1장을 등장시키고 남은 카드가 코스트 4 이하라면 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-058]],
    schema_version=1,
  })
end
