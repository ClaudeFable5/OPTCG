-- MANUAL: ST31-001 / 상디 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550031 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST31-001]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】이 캐릭터는 【속공】을 얻는다.]],
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
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              name_neq=[[상디]],
              trait=[[밀짚모자 일당]],
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
        source_text=[[【등장 시】카드를 1장 뽑고, 자신의 패에서 「상디」 이외의 코스트 5 이하인 특징 《밀짚모자 일당》을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST31-001]],
    schema_version=1,
  })
end
