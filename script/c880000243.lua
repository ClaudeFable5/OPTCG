-- AUTO-GENERATED: OP01-120 / 샹크스
-- rules_id=OP01-120 script_id=880000243 fingerprint=2c6018d6c600870ebbda3742b7d1c92b50326d1628e407098b626bdcd8042b88
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-120]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            filter={
              power_lte=2000,
            },
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】이번 배틀 중, 상대는 파워 2000 이하인 캐릭터의 【블로커】를 발동할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP01-120]],
    schema_version=1,
  })
end
