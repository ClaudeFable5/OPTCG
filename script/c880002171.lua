-- AUTO-GENERATED: OP14-006 / 샤치 & 펭귄
-- rules_id=OP14-006 script_id=880002171 fingerprint=452203abeda9e543b6b3f223c36c144eaae94b64e1137f1ed77641bf7bf2e5a4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            amount=5000,
            op=[[SELF_POWER_GTE]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】이 캐릭터의 파워가 5000 이상인 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-006]],
    schema_version=1,
  })
end
