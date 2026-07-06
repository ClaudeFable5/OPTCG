-- AUTO-GENERATED: ST14-011 / 헤라클레스
-- rules_id=ST14-011 script_id=880001929 fingerprint=b05ca2036bc385161229335d69ae4c6346d18128046fcd69c3c7f94c1c7f0e8c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST14-011]],
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
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 다음 상대의 턴 종료시까지, 자신의 흑색인 《밀짚모자 일당》 특징을 가진 캐릭터 1장까지의 코스트 +2.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST14-011]],
    schema_version=1,
  })
end
