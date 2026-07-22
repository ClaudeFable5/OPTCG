-- AUTO-GENERATED: OP14-093 / Mr.4(베이브)
-- rules_id=OP14-093 script_id=880002258 fingerprint=23789ded343dcb147c7c1574f3083daa37d936f0f92519df85d60c25e7f4b737
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-093]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=8,
              trait_contains=[[바로크 워크스]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 트래시에서 코스트 8 이하인 『바로크 워크스』를 포함한 특징을 가진 캐릭터 카드 1장까지를 패에 더한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP14-093]],
    schema_version=1,
  })
end
