-- MANUAL: OP17-024 / "하울링"갭 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-024]],
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BANISH]],
    },
    rules_id=[[OP17-024]],
    schema_version=1,
  })
end
