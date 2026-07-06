-- AUTO-GENERATED: OP09-058 / 특제 마기탄
-- rules_id=OP09-058 script_id=880001154 fingerprint=fb8f4965fa3fc147dad49174efc288c48fa23b0f794a9096f44910c55ede669b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-058]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            chooser=[[OPPONENT]],
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】상대는 자신의 코스트 6 이하인 캐릭터 1장을 주인의 패로 되돌린다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[코스트 3 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-058]],
    schema_version=1,
  })
end
