-- AUTO-GENERATED: OP15-027 / 쥬라큘 미호크
-- rules_id=OP15-027 script_id=880002329 fingerprint=3014f2cd6235581bdadbb78e362e0b233ade8ba0472eac214944d60bf97c1f74
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                don_given=true,
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
        source_text=[[【등장 시】상대의 두웅!!이 부여된 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-027]],
    schema_version=1,
  })
end
