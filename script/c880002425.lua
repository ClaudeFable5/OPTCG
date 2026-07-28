-- AUTO-GENERATED: EB04-004 / 제프
-- rules_id=EB04-004 script_id=880002425 fingerprint=e939108b538f6dbd6e7dc2ef1d6d9222d5345b20393c2560f046ab68554d4821
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[SET_BASE_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            value=7000,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 리더의 원래 파워는 다음 상대의 엔드 페이즈 종료 시까지 7000이 된다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-004]],
    schema_version=1,
  })
end
