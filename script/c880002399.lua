-- AUTO-GENERATED: OP15-097 / 인간으로서 수치스러워
-- rules_id=OP15-097 script_id=880002399 fingerprint=0c2e3c8f695e3739274de5b867664b569b1883a2c9efc42877ed2653633b2775
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-097]],
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
                base_cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            count=10,
            op=[[TRASH_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 트래시가 10장 이상인 경우, 상대의 원래 코스트 5 이하인 캐릭터 1장까지는 다음 상대의 엔드 페이즈 종료 시까지 어택할 수 없다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-097]],
    schema_version=1,
  })
end
