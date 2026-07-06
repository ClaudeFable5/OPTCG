-- AUTO-GENERATED: OP09-014 / 라임주스
-- rules_id=OP09-014 script_id=880001109 fingerprint=9dfc7c3ca92bb6c1f6c1df866b9874aff26fbcb05dceaf160375fbef3ff6ab73
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
            selector={
              count=1,
              filter={
                power_lte=4000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 상대의 파워 4000 이하인 캐릭터 1장까지는 【블로커】를 발동할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-014]],
    schema_version=1,
  })
end
