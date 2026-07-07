-- AUTO-GENERATED: ST17-002 / 트라팔가 로
-- rules_id=ST17-002 script_id=880002084 fingerprint=7da4de803e073d43ec893bc85c60b4875e1ec40dc025acade1cf46d576eeffaa
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST17-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[왕의 부하 칠무해]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_OWN_CARD_TO_HAND]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 캐릭터 1장을 주인의 패로 되돌릴 수 있다: 자신의 리더가 《왕의 부하 칠무해》 특징을 가진 경우, 코스트 4 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST17-002]],
    schema_version=1,
  })
end
