-- AUTO-GENERATED: OP13-032 / 니코 로빈
-- rules_id=OP13-032 script_id=880001604 fingerprint=517acea4347ef6b6c8fd5f193853ab29ff6ad4d08e1810ece80a48eb7ba0c8d7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_BE_RESTED]],
            reason=[[ANY]],
            selector={
              count=1,
              filter={
                cost_lte=8,
              },
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
        source_text=[[【등장 시】다음 상대의 엔드 페이즈 종료 시까지, 상대의 코스트 8 이하인 캐릭터 1장까지는 레스트로 할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-032]],
    schema_version=1,
  })
end
