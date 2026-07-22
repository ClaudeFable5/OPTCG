-- AUTO-GENERATED: OP14-035 / 요삭
-- rules_id=OP14-035 script_id=880002200 fingerprint=f27fc60c22ed5a72319a37ab59107b6634dbd92ba2dc81cb2e6fee7048b5a052
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-035]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=4,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】이 캐릭터가 레스트가 되었을 때, 상대의 레스트 상태인 코스트 4 이하의 캐릭터 1장까지는, 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[ON_SELF_RESTED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-035]],
    schema_version=1,
  })
end
