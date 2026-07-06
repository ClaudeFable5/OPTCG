-- AUTO-GENERATED: ST21-003 / 상디
-- rules_id=ST21-003 script_id=880001943 fingerprint=860e9626da61c184d7dffc576b06460aa75fa295666dc3901f72e559c24fa1dd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST21-003]],
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
                power_gte=6000,
                trait=[[밀짚모자 일당]],
              },
              kind=[[CHARACTER]],
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
        source_text=[[【등장 시】자신의 파워 6000 이상인 《밀짚모자 일당》 특징을 가진 캐릭터를 1장까지 선택한다. 이번 턴 동안, 선택한 캐릭터가 어택할 경우 상대는 【블로커】를 발동할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST21-003]],
    schema_version=1,
  })
end
