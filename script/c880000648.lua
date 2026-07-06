-- AUTO-GENERATED: OP05-036 / 모네
-- rules_id=OP05-036 script_id=880000648 fingerprint=42763c285e456d73f16cd4f2ffb53fc01245839a27e12511882bbf9754562646
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【블록 시】상대의 코스트 4 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP05-036]],
    schema_version=1,
  })
end
