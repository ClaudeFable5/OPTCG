-- AUTO-GENERATED: OP06-107 / 코즈키 모모노스케
-- rules_id=OP06-107 script_id=880000841 fingerprint=67cb791b70dcc6da9893bda86ce3547677e10169afe723697315975eb4796122
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-107]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            faceup=true,
            op=[[ADD_TO_OWNER_LIFE]],
            positions={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            selector={
              count=1,
              filter={
                name_neq=[[코즈키 모모노스케]],
                trait=[[와노쿠니]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 「코즈키 모모노스케」 이외의 《와노쿠니》 특징을 가진 캐릭터를 1장까지 주인의 라이프 맨 위나 아래에 앞면으로 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP06-107]],
    schema_version=1,
  })
end
