-- AUTO-GENERATED: ST05-004 / 우타
-- rules_id=ST05-004 script_id=880001786 fingerprint=94896cc45a633bed52358b1ff54524660bb893f3847e660711b824efa1438d56
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST05-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【블록 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 상대의 코스트 5 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST05-004]],
    schema_version=1,
  })
end
