-- AUTO-GENERATED: OP09-114 / 린드버그
-- rules_id=OP09-114 script_id=880001210 fingerprint=77caf092c9fc96d0e65ad915c1fcc0440a09524bc8d7505e82ed3b21ac258558
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-114]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                power_lte=2000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            count=5,
            op=[[LIFE_TOTAL_LTE]],
            players=[[BOTH]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】서로의 라이프 합계가 5장 이하인 경우, 상대의 파워 2000 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
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
            count=5,
            op=[[LIFE_TOTAL_LTE]],
            players=[[BOTH]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[서로의 라이프 합계가 5장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-114]],
    schema_version=1,
  })
end
