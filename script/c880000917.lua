-- AUTO-GENERATED: OP07-062 / 빈스모크 레이주
-- rules_id=OP07-062 script_id=880000917 fingerprint=2fc8a8201601b50d87520b3abf4e991fa58312fb2ed452620443b6e49f997f70
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-062]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_eq=1,
                trait=[[빈스모크 가문]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하인 경우, 자신의 코스트 1인 《빈스모크 가문》 특징을 가진 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-062]],
    schema_version=1,
  })
end
