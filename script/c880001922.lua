-- AUTO-GENERATED: ST14-004 / 징베
-- rules_id=ST14-004 script_id=880001922 fingerprint=8b3a64530bda5b97a08b6c8c1fc6675a681e6eca9710c7a746603682cd093de0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST14-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              filter={
                color=[[BLACK]],
                trait=[[밀짚모자 일당]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】다음 상대의 턴 종료 시까지, 자신의 흑색인 《밀짚모자 일당》 특징을 가진 캐릭터 1장까지의 코스트 +2.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST14-004]],
    schema_version=1,
  })
end
