-- MANUAL: OP16-080 / 마샬 D. 티치 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-080]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=1,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_COST]],
            selector={
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】 자신의 캐릭터 전부를 코스트 +1.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
      {
        actions={
          {
            op=[[CHANGE_ATTACK_TARGET]],
            selector={
              count=1,
              filter={
                any={
                  { card_type=[[LEADER]] },
                  { trait=[[검은 수염 해적단]] },
                },
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              has_trigger=true,
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】 자신의 패에서 【트리거】를 가진 카드 1장을 버릴 수 있다：그 어택의 대상을 이 리더나 자신의 특징 《검은 수염 해적단》을 가진 캐릭터로 변경한다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-080]],
    schema_version=1,
  })
end
