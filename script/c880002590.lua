-- MANUAL: OP16-033 / 모리 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-033]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[REPLACE_KO]],
            optional=true,
            replacement_costs={
              {
                count=2,
                kinds={
                  [[LEADER]],
                  [[CHARACTER]],
                  [[STAGE]],
                },
                op=[[REST_OWN_CARD]],
              },
            },
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터가 KO될 경우, 대신 자신의 카드 2장을 레스트로 할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[UNBLOCKABLE]],
    },
    rules_id=[[OP16-033]],
    schema_version=1,
  })
end
