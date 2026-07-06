-- AUTO-GENERATED: OP08-037 / 크릉츄
-- rules_id=OP08-037 script_id=880001013 fingerprint=496638c278eb6414513dd5dab5c1d705b942a75c4ee2bcca4a09f766019ef00a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-037]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[밍크족]],
            },
            kinds={
              [[CHARACTER]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 《밍크족》 특징을 가진 캐릭터 1장을 레스트할 수 있다: 상대의 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-037]],
    schema_version=1,
  })
end
