-- AUTO-GENERATED: OP14-048 / 시류
-- rules_id=OP14-048 script_id=880002213 fingerprint=77000e356a7fd5fbbeaeccc41379138d5ac8d011734c908eaa536f311ee8b289
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=0,
            op=[[TRASH_HAND_TO_COUNT]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 캐릭터 1장까지를 주인의 패로 되돌린다. 그 후, 자신의 모든 패를 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-048]],
    schema_version=1,
  })
end
