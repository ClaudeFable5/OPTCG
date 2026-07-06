-- AUTO-GENERATED: EB01-006 / 토니토니 쵸파
-- rules_id=EB01-006 script_id=880000005 fingerprint=cc521f6ebb4fc9fe2efffcc5e71bd7125c392648c24dd5a1be857d5d37c3fcd1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
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
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【어택 시】이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB01-006]],
    schema_version=1,
  })
end
