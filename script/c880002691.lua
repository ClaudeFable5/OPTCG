-- MANUAL: ST33-005 / 몽키 D. 가프 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550033 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST33-005]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[BLUE]],
              name_neq=[[몽키 D. 가프]],
              power_lte=8000,
              trait=[[해군]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[해군]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 특징 《해군》을 가진 경우, 자신의 패에서 「몽키 D. 가프」 이외의 파워 8000 이하인 청색 특징 《해군》을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST33-005]],
    schema_version=1,
  })
end
