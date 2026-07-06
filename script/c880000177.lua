-- AUTO-GENERATED: OP01-054 / X 드레이크
-- rules_id=OP01-054 script_id=880000177 fingerprint=4e66a9486497cd3491fc5780ffb4f4f08391447bd37929210ae0605e595939a7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-054]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=4,
                state=[[RESTED]],
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
        source_text=[[【등장 시】상대의 레스트 상태이고 코스트 4 이하인 캐릭터를 1장까지 KO시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-054]],
    schema_version=1,
  })
end
