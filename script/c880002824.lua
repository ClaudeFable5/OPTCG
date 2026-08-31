-- MANUAL: OP17-118 / 록스 D. 지벡 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-118]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=2000,
            op=[[MODIFY_COUNTER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              counter_eq=0,
            },
            op=[[ONLY_CHARACTERS_MATCH]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[패의 이 카드는, 자신의 캐릭터가 카운터를 가지지 않는 캐릭터뿐인 경우, 카운터 +2000을 가진다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            distinct_names=true,
            filter={
              cost_sum_lte=9,
              trait=[[록스 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 1장 뽑고, 자신의 패에서 카드명이 다른 특징 《록스 해적단》을 가진 카드 2장까지를, 코스트 합계가 9 이하가 되도록 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-118]],
    schema_version=1,
  })
end
