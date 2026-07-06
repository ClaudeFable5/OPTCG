-- AUTO-GENERATED: OP07-024 / 코알라
-- rules_id=OP07-024 script_id=880000878 fingerprint=2d4ce5fc747e111611c56ffabfb237d693015e0ecc5ff601f4146d7bc3384e31
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=0,
              filter={
                cost_lte=5,
                trait=[[어인족]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
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
        source_text=[[【상대의 어택 시】이 캐릭터를 레스트할 수 있다: 이번 턴 동안, 자신의 코스트 5 이하인 《어인족》 특징을 가진 캐릭터는 【블로커】를 얻는다.
(상대의 어택 선언 후, 이 카드를 레스트로 하고 어택의 대상을 이 카드로 할 수 있다)]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-024]],
    schema_version=1,
  })
end
