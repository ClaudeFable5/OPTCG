-- AUTO-GENERATED: OP09-035 / 포트거스 D. 에이스
-- rules_id=OP09-035@917e3eae2af6 script_id=880001131 fingerprint=917e3eae2af63bdab18b9a82a6d6672d923a77693166140b1d4dae09e655fc0d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-035]],
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
        source_text=[[【등장 시】자신의 레스트 상태인 캐릭터가 2장 이상인 경우, 상대의 코스트 5 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-035@917e3eae2af6]],
    schema_version=1,
  })
end
