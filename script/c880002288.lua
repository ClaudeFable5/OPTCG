-- AUTO-GENERATED: ST29-003 / 카쿠
-- rules_id=ST29-003 script_id=880002288 fingerprint=7b99388e7395ebca6ef7ace3c88f470a6b4dbdf2b50093cc36ff49e277b52264
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[LIFE_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 라이프 매수가 상대의 라이프 매수 이하인 경우, 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】상대의 코스트 3 이하인 캐릭터 1장까지를 KO한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST29-003]],
    schema_version=1,
  })
end
