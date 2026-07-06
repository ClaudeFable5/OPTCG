-- AUTO-GENERATED: OP13-002 / 포트거스 D. 에이스
-- rules_id=OP13-002 script_id=880001574 fingerprint=17ffdbb8d51c788fa9a5f4a7d494ed6e6e3309beaddad3844bdaf17b444c1f95
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】자신의 패 1장을 버릴 수 있다: 이번 배틀 동안, 상대의 리더 또는 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            amount=6000,
            op=[[EVENT_DAMAGE_OR_TARGET_BASE_POWER_GTE]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【턴 1회】자신이 대미지를 받았을 때 또는 자신의 원래 파워가 6000 이상인 캐릭터가 KO 당했을 때, 카드를 1장 뽑는다.]],
        timings={
          [[ON_DAMAGE_OR_HIGH_POWER_CHARACTER_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-002]],
    schema_version=1,
  })
end
