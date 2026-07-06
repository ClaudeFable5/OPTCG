-- AUTO-GENERATED: OP10-044 / 커브
-- rules_id=OP10-044 script_id=880001259 fingerprint=751491cf786a4274b47381d6b2f9dc21eb2a63c186f173ae63e9ecccb64d3d9e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-044]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
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
            filter={
              trait=[[드레스로자]],
            },
            kinds={
              [[LEADER]],
              [[STAGE]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 《드레스로자》 특징을 가진 리더 또는 스테이지 1장을 레스트할 수 있다: 상대의 코스트 1 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-044]],
    schema_version=1,
  })
end
