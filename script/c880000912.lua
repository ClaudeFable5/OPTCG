-- AUTO-GENERATED: OP07-057 / 퍼퓸 피머
-- rules_id=OP07-057 script_id=880000912 fingerprint=f86e50f909bbd01faf398fa5b8f23bb916fbe1f725843375efe3641af6d55534
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-057]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[왕의 부하 칠무해]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            attacker_selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
            duration=[[THIS_TURN]],
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】이번 턴 동안, 자신의 《왕의 부하 칠무해》 특징을 가진 리더 또는 캐릭터를 1장까지 선택해 파워 +2000. 그 후, 이번 턴 동안, 선택한 카드가 어택할 경우 상대는 【블로커】를 발동할 수 없다.]],
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
    rules_id=[[OP07-057]],
    schema_version=1,
  })
end
