-- AUTO-GENERATED: OP10-023 / 잇쇼
-- rules_id=OP10-023 script_id=880001238 fingerprint=56a14f4c36e60e4f67703922a40a0a34b2cc7dfa2964f020de1171f6bcc8f4e7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-023]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=2,
              filter={
                cost_lte=5,
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
            trait=[[해군]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《해군》 특징을 가진 경우, 상대의 코스트 5 이하인 캐릭터를 2장까지 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-023]],
    schema_version=1,
  })
end
