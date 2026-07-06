-- AUTO-GENERATED: OP09-033 / 니코 로빈
-- rules_id=OP09-033 script_id=880001128 fingerprint=da7152e0910a409ba55a49c97be55af7d129717c19a6e800e37c09c67b88ffad
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_BE_KO]],
            reason=[[EFFECT]],
            selector={
              count=0,
              filter={
                trait_any={
                  [[ODYSSEY]],
                  [[밀짚모자 일당]],
                },
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
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
        source_text=[[【등장 시】자신의 레스트 상태인 캐릭터가 2장 이상인 경우, 다음 상대의 턴 종료 시까지, 자신의 《ODYSSEY》 또는 《밀짚모자 일당》 특징을 가진 모든 캐릭터는 효과로는 KO 당하지 않는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-033]],
    schema_version=1,
  })
end
