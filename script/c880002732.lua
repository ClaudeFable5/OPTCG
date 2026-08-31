-- MANUAL: OP17-026 / 후거 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-026]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[빨간 머리 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 리더가 특징 《빨간 머리 해적단》을 가진 경우, 상대의 코스트 2 이하인 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-026]],
    schema_version=1,
  })
end
