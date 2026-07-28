-- AUTO-GENERATED: ST29-008 / 나미
-- rules_id=ST29-008 script_id=880002293 fingerprint=ef2a62ab5cb969716189a6b387e1a86a9b778727f44a0f904e67197cd979e665
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=1,
                faceup=true,
                op=[[FLIP_LIFE_TOP]],
              },
            },
            selector={
              count=1,
              filter={
                trait=[[에그 헤드]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 《에그 헤드》 특징을 가진 캐릭터가 상대의 효과로 KO될 경우, 대신 자신의 라이프 위에서 1장을 앞면으로 할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[몽키 D. 루피]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】자신의 리더가 「몽키 D. 루피」인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST29-008]],
    schema_version=1,
  })
end
