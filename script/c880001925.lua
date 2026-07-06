-- AUTO-GENERATED: ST14-007 / 니코 로빈
-- rules_id=ST14-007 script_id=880001925 fingerprint=cf6930ed11161f6a21d2cd13830c64aa4f8fe20cb598cbe2e3c3f8228eb42784
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST14-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-5,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            filter={
              cost_gte=8,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】자신의 코스트 8 이상인 캐릭터가 있을 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -5.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST14-007]],
    schema_version=1,
  })
end
