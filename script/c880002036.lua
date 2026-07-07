-- AUTO-GENERATED: P-038 / 트라팔가 로
-- rules_id=P-038 script_id=880002036 fingerprint=1ba72ac54e3e405527076c4ad2ca97eb8bb53722558f75081b7649ff25822ffb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-038]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=1,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={},
            kinds={
              [[LEADER]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더 1장을 레스트할 수 있다: 상대의 코스트 1 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-038]],
    schema_version=1,
  })
end
