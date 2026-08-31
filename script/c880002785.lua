-- MANUAL: OP17-079 / 몽키 D. 루피 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-079]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=0,
              filter={
                cost_gte=12,
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
        source_text=[[자신의 코스트 12 이상인 캐릭터 전부는 【블로커】를 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-079]],
    schema_version=1,
  })
end
