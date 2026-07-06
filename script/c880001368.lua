-- AUTO-GENERATED: OP11-034 / 핫짱
-- rules_id=OP11-034 script_id=880001368 fingerprint=febc699f7f1bd9f615351309205577f5a222641d2efafed232a7640db3ace2b7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_BE_RESTED]],
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
        conditions={
          {
            op=[[LEADER_HAS_TRAIT_ANY]],
            player=[[YOU]],
            traits={
              [[어인족]],
              [[인어족]],
            },
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 자신의 리더가 《어인족》 또는 《인어족》 특징을 가진 경우, 다음 상대의 턴 종료 시까지, 상대의 코스트 3 이하인 캐릭터 1장까지는 레스트할 수 없다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-034]],
    schema_version=1,
  })
end
