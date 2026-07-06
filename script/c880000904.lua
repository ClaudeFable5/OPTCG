-- AUTO-GENERATED: OP07-049 / 버킨
-- rules_id=OP07-049 script_id=880000904 fingerprint=f7aeaeb385cc110b252f3b163b8455442403211406b7892a9ced2dbc8625b1c7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-049]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=4,
              name=[[에드워드 위블]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 코스트 4 이하인 「에드워드 위블」을 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-049]],
    schema_version=1,
  })
end
