-- MANUAL: OP16-115 / 암수 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-115]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              has_trigger=true,
              name_neq=[[암수]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[검은 수염 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 리더가 특징 《검은 수염 해적단》을 가질 경우, 자신의 트래시에서 「암수」 이외의 【트리거】를 가진 카드 1장까지를 패에 넣는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[NEGATE_EFFECTS]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】 상대의 리더나 캐릭터 1장까지를 이번 턴 동안 효과를 무효로 한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-115]],
    schema_version=1,
  })
end
