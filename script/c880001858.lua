-- AUTO-GENERATED: ST09-010 / 포트거스 D. 에이스
-- rules_id=ST09-010 script_id=880001858 fingerprint=3e94a48a976506c8139ea6153404ea3e5ab2a5730aae154af47d05bfa139a369
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST09-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[ANY]],
            replacement_costs={
              {
                count=1,
                op=[[TRASH_LIFE_TOP]],
                position=[[TOP_OR_BOTTOM]],
              },
            },
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
        once_per_turn=true,
        source_text=[[【턴 1회】이 캐릭터가 KO 당할 경우, 대신 자신의 라이프 위나 아래에서 1장을 트래시에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[ST09-010]],
    schema_version=1,
  })
end
