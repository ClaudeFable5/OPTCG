-- AUTO-GENERATED: OP13-028 / 샹크스
-- rules_id=OP13-028 script_id=880001600 fingerprint=8705d36e8e2b9c5ef122e4ffdd171c7f2b00a76938718a56b82b53aa7fc73ff4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=10,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
          {
            duration=[[THIS_TURN]],
            filter={},
            op=[[CANNOT_PLAY]],
            player=[[YOU]],
            ["then"]=true,
            zone=[[HAND]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 모든 두웅!!을 액티브로 한다. 그 후, 이번 턴 동안, 자신은 패에서 카드를 플레이할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-028]],
    schema_version=1,
  })
end
