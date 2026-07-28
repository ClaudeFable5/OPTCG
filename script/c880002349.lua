-- AUTO-GENERATED: OP15-047 / 상디
-- rules_id=OP15-047 script_id=880002349 fingerprint=ecec732739058bd331153f510ade376cfcb55d7fb2d09a96ac7ee75067ad33a2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-047]],
    compile_status=[[AUTO]],
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 캐릭터 1장까지는 이번 턴 동안 【언블로커블】을 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP15-047]],
    schema_version=1,
  })
end
