-- AUTO-GENERATED: OP10-100 / 이나즈마
-- rules_id=OP10-100 script_id=880001315 fingerprint=8ca49eb1b73e8eb851872f23718bb867534ef78911ab25c8f2f853abf829818e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-100]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte_life_total=true,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】서로의 라이프 합계 이하의 코스트를 가진 상대의 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[혁명군]],
          },
          {
            count=5,
            op=[[LIFE_TOTAL_LTE]],
            players=[[BOTH]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《혁명군》 특징을 가지고, 서로의 라이프 합계가 5장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-100]],
    schema_version=1,
  })
end
