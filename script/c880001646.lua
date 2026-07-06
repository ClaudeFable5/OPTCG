-- AUTO-GENERATED: OP13-074 / 헤라
-- rules_id=OP13-074 script_id=880001646 fingerprint=89596d4e446f1664ceec17cbd0eefdee31d987b567160d3c3d1eb5a93bc92e5e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-074]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_lte=3000,
              trait=[[호미즈]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 파워 3000 이하인 《호미즈》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-074]],
    schema_version=1,
  })
end
