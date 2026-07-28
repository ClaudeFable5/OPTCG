-- AUTO-GENERATED: ST29-016 / 키자루!! 우리는 2년 전보다 100배는 강하다고
-- rules_id=ST29-016 script_id=880002301 fingerprint=4c234ed08cea47170843c28cced2f9ea83b17885631ddd67899b6bc1ebc0b6ac
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[UNBLOCKABLE]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                name=[[몽키 D. 루피]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 「몽키 D. 루피」 리더는 이번 턴 동안 【언블로커블】을 얻는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 리더는 이번 배틀 동안 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST29-016]],
    schema_version=1,
  })
end
