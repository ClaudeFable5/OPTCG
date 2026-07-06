-- AUTO-GENERATED: ST02-010 / 바질 호킨스
-- rules_id=ST02-010 script_id=880001739 fingerprint=669fa3acdb0b2e4a210bd3a2dc619270b51d4e34edfe87c5a461aab80b73a47d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST02-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!x1】【턴 1회】【자신의 턴 동안】이 캐릭터가 상대 캐릭터와 배틀했을 경우, 이 캐릭터를 액티브로 한다.]],
        timings={
          [[AFTER_BATTLE_WITH_OPPONENT_CHARACTER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST02-010]],
    schema_version=1,
  })
end
