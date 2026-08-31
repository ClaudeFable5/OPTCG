-- MANUAL: OP17-087 / 니코 로빈 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-087]],
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
        conditions={
          {
            filter={
              cost_gte=12,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[ANY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[코스트 12 이상인 캐릭터가 있을 경우, 이 캐릭터의 파워 +3000.]],
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
        conditions={
          {
            filter={
              cost_gte=12,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[ANY]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】코스트 12 이상인 캐릭터가 있을 경우, 상대의 캐릭터 1장까지를 이번 턴 동안 파워 -3000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-087]],
    schema_version=1,
  })
end
