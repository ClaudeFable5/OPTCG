-- AUTO-GENERATED: OP03-024 / 깅
-- rules_id=OP03-024 script_id=880000390 fingerprint=8f9108bdf142622ca791fe3b989857afafb714d566ff9561bc3ba2fcfc096291
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=2,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[이스트 블루]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《이스트 블루》 특징을 가진 경우, 상대의 코스트 4 이하인 캐릭터를 2장까지 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-024]],
    schema_version=1,
  })
end
