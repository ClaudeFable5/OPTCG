-- MANUAL: OP17-023 / 나미 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-023]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[REPLACE_KO]],
            optional=true,
            replacement_costs={
              {
                op=[[REST_SELF]],
              },
            },
            selector={
              count=1,
              filter={
                any={
                  {
                    trait=[[이스트 블루]],
                  },
                  {
                    trait=[[밀짚모자 일당]],
                  },
                },
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 특징 《이스트 블루》나 《밀짚모자 일당》을 가진 캐릭터가 KO될 경우, 대신 이 캐릭터를 레스트로 할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-023]],
    schema_version=1,
  })
end
