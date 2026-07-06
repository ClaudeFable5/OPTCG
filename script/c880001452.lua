-- AUTO-GENERATED: OP11-118 / 몽키 D. 루피
-- rules_id=OP11-118 script_id=880001452 fingerprint=0bf6437dc760d29ddd618580e4aa83e0d0abac91145c066b9537d548ddd346c6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-118]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
            ["then"]=true,
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
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패 1장을 버릴 수 있다: 코스트 4 이하인 캐릭터를 1장까지 주인의 패로 되돌린다. 그 후, 자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP11-118]],
    schema_version=1,
  })
end
