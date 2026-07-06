-- AUTO-GENERATED: OP06-027 / 자이로
-- rules_id=OP06-027 script_id=880000761 fingerprint=79af3b2394bd64e1593d8f50b65650b1fe1183a50657aa493d45424edf04528b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=3,
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
        source_text=[[【KO 시】상대의 코스트 3 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-027]],
    schema_version=1,
  })
end
