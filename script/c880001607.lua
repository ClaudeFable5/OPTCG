-- AUTO-GENERATED: OP13-035 / 베포
-- rules_id=OP13-035 script_id=880001607 fingerprint=01ba92fd9f20f957507b27f51d1472933862648c4943de69c61b6ba0099fff3a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-035]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=1,
              filter={
                state=[[RESTED]],
              },
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            count=1,
            mode=[[UP_TO]],
            op=[[SET_ACTIVE_CARD_OR_DON]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】이 캐릭터 또는 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-035]],
    schema_version=1,
  })
end
