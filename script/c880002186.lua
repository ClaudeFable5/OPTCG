-- AUTO-GENERATED: OP14-021 / 잇쇼
-- rules_id=OP14-021 script_id=880002186 fingerprint=26ab0f3910830535e765fb2aac1fb94c69306d22fef0f020b5030de327eb9902
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-021]],
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
                state=[[RESTED]],
              },
              kind=[[CHARACTER_OR_STAGE]],
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
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】이 캐릭터가 레스트가 되었을 때, 자신의 라이프 위에서 1장을 패에 더해도 된다. 이 경우, 상대의 레스트 상태인 캐릭터나 스테이지 1장까지는, 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[ON_SELF_RESTED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-021]],
    schema_version=1,
  })
end
