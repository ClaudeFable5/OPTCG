-- AUTO-GENERATED: OP08-088 / 듀발
-- rules_id=OP08-088 script_id=880001064 fingerprint=1fa9ca275a1bc66151a0fdacb77a2de28a53a6d5b9e3b3a231faa700b1bf11bc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-088]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】다음 상대의 턴 종료 시까지, 자신의 캐릭터 1장까지의 코스트 +1.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-088]],
    schema_version=1,
  })
end
