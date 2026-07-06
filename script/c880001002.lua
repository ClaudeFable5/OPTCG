-- AUTO-GENERATED: OP08-026 / 조반니
-- rules_id=OP08-026 script_id=880001002 fingerprint=046e6b3fdf9e543ccf77cd83bca48434e9c9fb54554133276dbc8b278e56f425
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-026]],
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
                cost_lte=1,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】상대의 레스트 상태이고 코스트 1 이하인 캐릭터 1장까지는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-026]],
    schema_version=1,
  })
end
