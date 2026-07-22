-- AUTO-GENERATED: OP14-025 / 크로
-- rules_id=OP14-025 script_id=880002190 fingerprint=02f518c69419f41d39f38ca4de0630c9cf2e3c6ecf4d32487f703fcef341cf88
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=6,
              trait=[[이스트 블루]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[크로]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「크로」인 경우, 자신의 패에서 코스트 6 이하인 《이스트 블루》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-025]],
    schema_version=1,
  })
end
