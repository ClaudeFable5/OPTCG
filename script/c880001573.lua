-- AUTO-GENERATED: OP13-001 / 몽키 D. 루피
-- rules_id=OP13-001 script_id=880001573 fingerprint=871d94d85a7fd3a848058e1ead6cfa8821fc53792b7420b37223e64f5d529d68
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=2000,
            divisor=1,
            duration=[[THIS_BATTLE]],
            op=[[REST_DON_FOR_POWER]],
            player=[[YOU]],
            selector={
              count=1,
              filter={
                any={
                  {
                    card_type=[[LEADER]],
                  },
                  {
                    card_type=[[CHARACTER]],
                    trait=[[밀짚모자 일당]],
                  },
                },
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=5,
            op=[[ACTIVE_DON_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【상대의 어택 시】자신의 액티브 상태인 두웅!!이 5장 이하인 경우, 자신의 두웅!!을 원하는 수만큼 레스트할 수 있다. 레스트한 두웅!! 1장당, 이번 배틀 동안, 이 리더 또는 자신의 《밀짚모자 일당》 특징을 가진 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-001]],
    schema_version=1,
  })
end
