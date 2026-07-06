-- AUTO-GENERATED: OP09-036 / 몽키 D. 루피
-- rules_id=OP09-036 script_id=880001132 fingerprint=e55723afe333b500cb1cc2ca928c87a090aec6c7217b6980feb45a12b9e079c6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=1,
              filter={
                cost_lte=6,
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
        conditions={
          {
            count=2,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 레스트 상태인 캐릭터가 2장 이상인 경우, 상대의 코스트 6 이하인 캐릭터 1장 또는 두웅!! 1장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-036]],
    schema_version=1,
  })
end
