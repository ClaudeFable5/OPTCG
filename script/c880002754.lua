-- MANUAL: OP17-048 / 시키 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-048]],
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
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait_contains=[[록스 해적단]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【어택 시】/【상대의 어택 시】【턴 1회】자신의 패에서 『록스 해적단』을 포함한 특징을 가진 카드 1장을 버릴 수 있다：상대의 캐릭터 1장까지를 이번 턴 동안 파워 -3000.]],
        timings={
          [[WHEN_ATTACKING]],
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-048]],
    schema_version=1,
  })
end
