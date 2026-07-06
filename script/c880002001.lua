-- AUTO-GENERATED: ST28-002 / 이조
-- rules_id=ST28-002 script_id=880002001 fingerprint=613075ae59b294c7af2655c520aca2c2450533bfea4b238c6b1f5920d4423408
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST28-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】이 캐릭터는 【블로커】를 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[BANISH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                trait=[[와노쿠니]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 《와노쿠니》 특징을 가진 리더는 【배니시】를 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST28-002]],
    schema_version=1,
  })
end
