-- AUTO-GENERATED: OP08-033 / 로디
-- rules_id=OP08-033 script_id=880001009 fingerprint=c619886da1a4eae6ec72ccbb1e15190601118b4f5eb0669c8f0fbf784ae05ab4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=2,
                state=[[RESTED]],
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
            trait=[[밍크족]],
          },
          {
            count=7,
            op=[[OPPONENT_RESTED_CARD_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《밍크족》 특징을 가지고, 상대의 레스트 상태인 카드가 7장 이상인 경우, 상대의 레스트 상태이고 코스트 2 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-033]],
    schema_version=1,
  })
end
