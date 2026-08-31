-- MANUAL: OP17-067 / 쿠로즈미 칸주로 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-067]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[REST]],
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
              cost_gte=10,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1：자신의 코스트 10 이상인 캐릭터가 있을 경우, 상대의 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-067]],
    schema_version=1,
  })
end
