-- AUTO-GENERATED: OP12-051 / 히나
-- rules_id=OP12-051 script_id=880001504 fingerprint=14bdf0a9250186a73ed898d98f4efe4562acd3170d40ff1701efa76f545e6964
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-051]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            selector={
              count=1,
              filter={
                base_cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트하고, 자신의 패 1장을 버릴 수 있다: 이번 턴 동안, 상대의 원래 코스트가 4 이하인 캐릭터 1장까지는 【블로커】를 발동할 수 없다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-051]],
    schema_version=1,
  })
end
