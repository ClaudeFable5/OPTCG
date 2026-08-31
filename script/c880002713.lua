-- MANUAL: OP17-007 / 코즈키 오뎅 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-007]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              any={
                {
                  trait=[[와노쿠니]],
                },
                {
                  trait_contains=[[흰 수염 해적단]],
                },
              },
              card_type=[[CHARACTER]],
              power_lte=6000,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[에드워드 뉴게이트]],
            op=[[LEADER_NAME_IS_OR_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[와노쿠니]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「에드워드 뉴게이트」거나 특징 《와노쿠니》를 가진 경우, 자신의 패에서 파워 6000 이하인, 특징 《와노쿠니》나 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-007]],
    schema_version=1,
  })
end
