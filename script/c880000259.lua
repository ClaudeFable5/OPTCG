-- AUTO-GENERATED: OP02-015 / 마키노
-- rules_id=OP02-015 script_id=880000259 fingerprint=77a9fea566105979fee9d1afe1e9a735510d8c320b3bc27dcbb10e97c75684c5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                color=[[RED]],
                cost_eq=1,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 이번 턴 동안, 자신의 코스트 1인 적색 캐릭터 1장까지의 파워 +3000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-015]],
    schema_version=1,
  })
end
