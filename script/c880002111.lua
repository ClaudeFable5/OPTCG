-- AUTO-GENERATED: EB03-008 / 히바리
-- rules_id=EB03-008 script_id=880002111 fingerprint=149685ef074ef1cea395b26509546f6b43ebaa9409b0d0ca77a2baece9406130
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[ALLOW_ATTACK_ACTIVE_CHARACTER]],
            selector={
              count=1,
              filter={
                trait=[[SWORD]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】이번 턴 동안, 자신의 《SWORD》 특징을 가진 리더 또는 캐릭터 1장까지는 액티브 상태인 캐릭터도 어택할 수 있다.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
      {
        actions={
          {
            amount=-1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-008]],
    schema_version=1,
  })
end
