-- MANUAL: OP17-083 / 징베 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-083]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
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
        source_text=[[코스트 12 이상인 캐릭터가 있을 경우, 이 캐릭터는 【블로커】를 얻고, 파워 +3000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-083]],
    schema_version=1,
  })
end
