-- AUTO-GENERATED: OP07-086 / 스팬담
-- rules_id=OP07-086 script_id=880000941 fingerprint=e1ea21ebbd49bc9b4c28de0bb2d6adf8f774cf2ad37281f409c35d74829a0219
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-086]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
          {
            amount=-2,
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
        source_text=[[【등장 시】자신의 덱 위에서 2장을 트래시에 놓고, 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -2.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-086]],
    schema_version=1,
  })
end
