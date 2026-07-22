-- AUTO-GENERATED: OP14-091 / Mr.2 봉쿠레(벤담)
-- rules_id=OP14-091 script_id=880002256 fingerprint=430ba4307f2b7e161094d713d44eeb3cb79e9672dd6ff4c8e6c68ed262c79da0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-091]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              name_neq=[[Mr.2 봉쿠레(벤담)]],
              trait_contains=[[바로크 워크스]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND_OR_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패나 트래시에서 「Mr.2 봉쿠레(벤담)」 이외의 코스트 5 이하인 『바로크 워크스』를 포함한 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-091]],
    schema_version=1,
  })
end
