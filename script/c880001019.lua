-- AUTO-GENERATED: OP08-043 / 에드워드 뉴게이트
-- rules_id=OP08-043 script_id=880001019 fingerprint=e247dc5bef27c9c7132c1a99ab95a6f6872789d597468a073aa3ad461887839b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-043]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                attacker_filter={
                  card_type=[[CHARACTER]],
                },
                count=2,
                duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
                op=[[REQUIRE_HAND_DISCARD_TO_ATTACK]],
                player=[[OPPONENT]],
              },
            },
            conditions={
              {
                op=[[LEADER_TRAIT_CONTAINS]],
                player=[[YOU]],
                trait=[[흰 수염 해적단]],
              },
              {
                count=2,
                op=[[LIFE_LTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가지고, 자신의 라이프가 2장 이하인 경우, 다음 상대의 턴 종료 시까지, 상대의 모든 캐릭터는 어택할 때 자신의 패 2장을 버리지 않으면 어택할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-043]],
    schema_version=1,
  })
end
