-- AUTO-GENERATED: OP10-048 / 사이
-- rules_id=OP10-048 script_id=880001263 fingerprint=8fae305be598bbd57fc6936090a164946223e4bbc0a8cb780d1142b366f867a3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-048]],
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
    rules_id=[[OP10-048]],
    schema_version=1,
  })
end
