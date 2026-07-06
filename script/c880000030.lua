-- AUTO-GENERATED: EB01-031 / 칼리파
-- rules_id=EB01-031 script_id=880000030 fingerprint=3a2463c9c08ec1c163bbe907cdca81a042dca344dd8299d2458a8cc43e5ae841
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[워터 세븐]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 리더가 《워터 세븐》 특징을 가진 경우, 자신의 트래시에서 코스트 4 이하인 캐릭터 카드를 2장까지 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-031]],
    schema_version=1,
  })
end
