-- AUTO-GENERATED: OP06-012 / 베어 킹
-- rules_id=OP06-012 script_id=880000746 fingerprint=5bea12bb679b52ed666f22fe6c823ea9590296e7f2c701b8295d6fcf75a57a5e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[BATTLE]],
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
            filter={
              base_power_gte=6000,
            },
            op=[[LEADER_OR_CHARACTER_EXISTS]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[상대의 원래 파워가 6000 이상인 리더 또는 캐릭터가 있을 경우, 이 캐릭터는 배틀에서 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-012]],
    schema_version=1,
  })
end
