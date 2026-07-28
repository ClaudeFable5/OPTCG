-- AUTO-GENERATED: OP15-065 / 고로
-- rules_id=OP15-065 script_id=880002367 fingerprint=2ad2c7a4b22ef4f60e054ee7cfd1462cd0642c76677195979325545c37ad4ac8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-065]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=2,
            },
            on_match={
              {
                count=1,
                mode=[[UP_TO]],
                op=[[ADD_DON]],
                state=[[RESTED]],
              },
            },
            op=[[REVEAL_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 1장을 공개한다. 공개한 카드가 코스트 2 이하인 경우, 두웅!! 덱에서 두웅!! 1장까지를 레스트로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-065]],
    schema_version=1,
  })
end
