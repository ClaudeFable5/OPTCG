-- AUTO-GENERATED: OP13-094 / 요크
-- rules_id=OP13-094 script_id=880001666 fingerprint=cf8a53f83002a6f08c8af9482baa287735c4d7be5cb444319417c52912a6356d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-094]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[천룡인]],
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
        source_text=[[【등장 시】이번 턴 동안, 자신의 《천룡인》 특징을 가진 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-094]],
    schema_version=1,
  })
end
