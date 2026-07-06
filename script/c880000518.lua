-- AUTO-GENERATED: OP04-027 / 대디 마스터슨
-- rules_id=OP04-027 script_id=880000518 fingerprint=ef65fa19e62afb7e5b584834d0e2c27b22e10535e5166b30e38c840c8e8ef7f0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-027]],
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
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 종료 시】이 캐릭터를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-027]],
    schema_version=1,
  })
end
