-- MANUAL: OP17-084 / 토니토니 쵸파 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-084]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[UNBLOCKABLE]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[CHARACTER]],
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
        source_text=[[【등장 시】코스트 12 이상인 캐릭터가 있을 경우, 자신의 캐릭터 1장까지는 이번 턴 동안 【블록 불가】를 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-084]],
    schema_version=1,
  })
end
