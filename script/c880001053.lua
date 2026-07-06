-- AUTO-GENERATED: OP08-077 / 패해
-- rules_id=OP08-077 script_id=880001053 fingerprint=2f7ef28599bd549296293e7264724f14e610169d498bc7722b351e45805f0093
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-077]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=2,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT_ANY]],
            player=[[YOU]],
            traits={
              [[백수 해적단]],
              [[빅 맘 해적단]],
            },
          },
        },
        costs={
          {
            count=2,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】두웅!!-2(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 리더가 《백수 해적단》 또는 《빅 맘 해적단》 특징을 가진 경우, 상대의 코스트 6 이하인 캐릭터를 2장까지 KO 시킨다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-077]],
    schema_version=1,
  })
end
