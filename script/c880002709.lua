-- MANUAL: OP17-003 / 이조 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-003]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[TURN_PLAYED]],
            op=[[ALLOW_ATTACK_CHARACTER]],
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
        effect_id=[[E0]],
        once_per_turn=false,
        source_text=[[【속공：캐릭터】(이 카드는 등장한 턴에 캐릭터에게 어택할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },

      {
        actions={
          {
            amount=-6000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
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
        source_text=[[【등장 시】자신의 리더가 「에드워드 뉴게이트」거나 특징 《와노쿠니》를 가진 경우, 상대의 레스트 상태인 캐릭터 1장까지를 이번 턴 동안 파워 -6000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-003]],
    schema_version=1,
  })
end
