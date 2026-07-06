-- AUTO-GENERATED: OP04-028 / 디아만테
-- rules_id=OP04-028 script_id=880000519 fingerprint=c5717ba074697d5cfead431cfb0da0a06cf1af3c6c8884e69e02e1277e753fa8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-028]],
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
            count=2,
            op=[[ACTIVE_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 종료 시】자신의 액티브 상태인 두웅!!이 2장 이상인 경우, 이 캐릭터를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP04-028]],
    schema_version=1,
  })
end
