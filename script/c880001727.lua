-- AUTO-GENERATED: ST01-016 / 디아블 잠브
-- rules_id=ST01-016 script_id=880001727 fingerprint=5c219d2e6d9f7dfc6c5431efe70de912fb75061fbad7a88752e222de48b065f0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST01-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=0,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[밀짚모자 일당]],
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
        source_text=[[【메인】자신의 《밀짚모자 일당》 특징을 가진 리더 또는 캐릭터를 1장까지 선택한다. 이번 턴 동안, 상대는 그 리더 또는 캐릭터가 어택할 경우 【블로커】를 발동할 수 없다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
                keyword=[[BLOCKER]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 코스트 3 이하이고 【블로커】를 가진 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST01-016]],
    schema_version=1,
  })
end
