-- AUTO-GENERATED: ST26-002 / 토니토니 쵸파
-- rules_id=ST26-002 script_id=880001991 fingerprint=20810a871d652cc8c4cd72117e0a844a788571ef997b2f6f9bf22fbd1c1ae84c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST26-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=1,
              filter={
                cost_lte=1,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            count=1,
            mode=[[UP_TO]],
            op=[[REST_CARD_OR_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-2(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 상대의 코스트 1 이하인 캐릭터 또는 두웅!!을 1장까지 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST26-002]],
    schema_version=1,
  })
end
