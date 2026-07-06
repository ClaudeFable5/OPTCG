-- AUTO-GENERATED: OP10-029 / 쥬라큘 미호크
-- rules_id=OP10-029 script_id=880001244 fingerprint=7b5bb1c097fb2a5449ac689f26d0b4082e7adf9c6830efc0c6bc0daf926f66db
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-029]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=5,
                state=[[RESTED]],
                trait=[[ODYSSEY]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=2,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 레스트 상태인 캐릭터가 2장 이상인 경우, 자신의 레스트 상태이고 코스트 5 이하인 《ODYSSEY》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-029]],
    schema_version=1,
  })
end
