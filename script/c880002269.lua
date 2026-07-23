-- AUTO-GENERATED: OP14-104 / 겟코 모리아
-- rules_id=OP14-104 script_id=880002269 fingerprint=0c0240aac2fcf4290ce7ea8fef64d839fdbe5aab9a1911088d6f7892310550e3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-104]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            options={
              {
                {
                  count=1,
                  faceup=true,
                  filter={
                    card_type=[[CHARACTER]],
                    cost_lte=4,
                    trait=[[스릴러 바크 해적단]],
                  },
                  mode=[[UP_TO]],
                  op=[[ADD_LIFE_FROM_TRASH]],
                  player=[[YOU]],
                  position=[[TOP]],
                },
              },
              {
                {
                  count=1,
                  filter={
                    card_type=[[CHARACTER]],
                    cost_lte=4,
                    trait=[[스릴러 바크 해적단]],
                  },
                  mode=[[UP_TO]],
                  op=[[PLAY_FROM_TRASH]],
                  player=[[YOU]],
                  rested=false,
                },
              },
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 코스트 4 이하인 《스릴러 바크 해적단》 특징을 가진 캐릭터 카드 1장까지를, 라이프 맨 위에 앞면으로 더하거나 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 트래시에서 코스트 4 이하인 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-104]],
    schema_version=1,
  })
end
