-- AUTO-GENERATED: OP07-010 / 바카라
-- rules_id=OP07-010 script_id=880000863 fingerprint=9c8d01874094458bebab6b41be65e64f8c7a32b058c00fe9f377fc3aa3b2ec37
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
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
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】자신의 패 1장을 버릴 수 있다: 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP07-010]],
    schema_version=1,
  })
end
