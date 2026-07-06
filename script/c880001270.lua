-- AUTO-GENERATED: OP10-055 / 마르코
-- rules_id=OP10-055 script_id=880001270 fingerprint=45fd437444bbf155d54057afb2b3f2330a26aaa2fa1f8131228c931a8ba67385
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
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
        source_text=[[【KO 시】상대의 코스트 4 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP10-055]],
    schema_version=1,
  })
end
