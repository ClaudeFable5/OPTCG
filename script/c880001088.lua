-- AUTO-GENERATED: OP08-112 / S-스네이크
-- rules_id=OP08-112 script_id=880001088 fingerprint=fc53f01cd18c2bf1d81c11aae7ab130925eb1efdcbc60cd7e8bba184750500d1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-112]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_ATTACK]],
            selector={
              count=1,
              filter={
                cost_lte=6,
                name_neq=[[몽키 D. 루피]],
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
        source_text=[[【등장 시】다음 상대의 턴 종료 시까지, 「몽키 D. 루피」 이외의 상대의 코스트 6 이하인 캐릭터 1장까지는 어택할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            effect_timing=[[ON_PLAY]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【등장 시】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-112]],
    schema_version=1,
  })
end
