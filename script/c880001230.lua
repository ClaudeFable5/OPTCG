-- AUTO-GENERATED: OP10-015 / 모차
-- rules_id=OP10-015 script_id=880001230 fingerprint=160af308ce36ebdafae0bf530d248c551e48e19e8480682516f9e770b7e24d1d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1000,
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -1000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-015]],
    schema_version=1,
  })
end
