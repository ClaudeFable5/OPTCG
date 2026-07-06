-- AUTO-GENERATED: OP11-088 / 슈
-- rules_id=OP11-088 script_id=880001422 fingerprint=f0c760c9fd7cc793fff11a361781aff6b32176c23b0c358beae009a26d4b2496
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-088]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                amount=5000,
                duration=[[THIS_BATTLE]],
                op=[[MODIFY_POWER]],
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
                attribute=[[SLASH]],
                op=[[BATTLE_ATTACKER_HAS_ATTRIBUTE]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【턴 1회】상대의 캐릭터가 어택했을 때, 발동할 수 있다. 그 캐릭터가 <참격> 속성을 가진 경우, 이번 배틀 동안, 이 캐릭터의 파워 +5000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-088]],
    schema_version=1,
  })
end
