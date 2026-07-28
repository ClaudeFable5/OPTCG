-- AUTO-GENERATED: OP15-096 / 비연 봉 아방
-- rules_id=OP15-096 script_id=880002398 fingerprint=3ce500f4c01cba2a826bc38e83dee52d6a4d3a5bfc4bd1eca37df23b9d4ac073
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-096]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=5,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밀짚모자 일당]],
          },
        },
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 두웅!! 1장을 레스트로 할 수 있다: 자신의 리더가 《밀짚모자 일당》 특징을 가진 경우, 자신의 덱 위에서 5장을 트래시에 놓는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 패 1장을 버릴 수 있다: 자신의 리더나 캐릭터 1장까지는 이번 배틀 동안 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-096]],
    schema_version=1,
  })
end
