-- AUTO-GENERATED: OP07-082 / 캡틴 존
-- rules_id=OP07-082 script_id=880000937 fingerprint=5e97eceaa449bb68e0eb7d120542f4ebcc80df066f205c44d11e1b548732c7a8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-082]],
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
            amount=-1,
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
        source_text=[[【등장 시】자신의 덱 위에서 2장을 트래시에 놓고, 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -1.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-082]],
    schema_version=1,
  })
end
