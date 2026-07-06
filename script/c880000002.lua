-- AUTO-GENERATED: EB01-003 / 키드 & 킬러
-- rules_id=EB01-003 script_id=880000002 fingerprint=aeec705ae66a8995473c745cc3bd838ccf50837c6218e994e3a70e85f63dcac8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
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
            count=2,
            op=[[LIFE_LTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】상대의 라이프가 2장 이하인 경우, 이번 턴 동안, 이 캐릭터의 파워 +2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[EB01-003]],
    schema_version=1,
  })
end
