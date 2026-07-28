-- AUTO-GENERATED: EB04-045 / 지니
-- rules_id=EB04-045 script_id=880002466 fingerprint=9e69ad468021af91be0c318d22ee52a672e272dfa2a7eab0853209b1a91c3159
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[혁명군]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=2,
            filter={
              cost_gte=8,
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[ANY]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트로 할 수 있다: 코스트 8 이상인 캐릭터가 2장 이상 있는 경우, 자신의 《혁명군》 특징을 가진 리더나 캐릭터 1장까지는 이번 턴 동안 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-045]],
    schema_version=1,
  })
end
