-- MANUAL: OP17-009 / 하루타 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-009]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】이 캐릭터의 파워 +3000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=2000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 원래 파워 2000 이하인 캐릭터 1장까지를 KO한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-009]],
    schema_version=1,
  })
end
