-- MANUAL: OP17-022 / 샹크스 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-022]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
          {
            op=[[REST]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 두웅!! 2장까지를 액티브로 한다. 그 후, 상대의 캐릭터 모두를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP17-022]],
    schema_version=1,
  })
end
