-- AUTO-GENERATED: OP02-051 / 엠포리오 이반코프
-- rules_id=OP02-051 script_id=880000296 fingerprint=6a80cac96552e4fed820f16d689a345d98b78ae36348679484c4e806261c7545
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-051]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            op=[[DRAW_TO_HAND_COUNT]],
            player=[[YOU]],
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[BLUE]],
              cost_lte=6,
              trait=[[임펠 다운]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패가 3장이 되도록 카드를 뽑고 자신의 패에서 코스트 6 이하이고 청색인 《임펠 다운》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-051]],
    schema_version=1,
  })
end
