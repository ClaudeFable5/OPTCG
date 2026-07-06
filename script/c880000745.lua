-- AUTO-GENERATED: OP06-011 / 토트 무지카
-- rules_id=OP06-011 script_id=880000745 fingerprint=704e26de16a0d096495d0bcdf3444019b622ad3ad2496377eb9166cc2ce242fc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=5000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              name=[[우타]],
            },
            kinds={
              [[LEADER]],
              [[CHARACTER]],
              [[STAGE]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 「우타」 1장을 레스트할 수 있다: 이번 턴 동안, 이 캐릭터의 파워 +5000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-011]],
    schema_version=1,
  })
end
