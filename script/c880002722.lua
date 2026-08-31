-- MANUAL: OP17-016 / 라쿠요 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-016]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=2,
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 원래 파워 2000 이하인 캐릭터 2장까지를 KO한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-016]],
    schema_version=1,
  })
end
