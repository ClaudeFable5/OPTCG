-- AUTO-GENERATED: OP02-117 / 아이스 에이지
-- rules_id=OP02-117 script_id=880000362 fingerprint=14d880ebb3b546c31746a9122c5c8536f2652a2e6841248bd0b8d019e3afb640
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-117]],
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -5.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 코스트 3 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-117]],
    schema_version=1,
  })
end
