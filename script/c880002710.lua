-- MANUAL: OP17-004 / 이누아라시 & 네코마무시 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-004]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                any={
                  {
                    trait=[[와노쿠니]],
                  },
                  {
                    trait_contains=[[흰 수염 해적단]],
                  },
                },
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 특징 《와노쿠니》나 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터 1장까지는 이번 턴 동안 【속공】을 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-004]],
    schema_version=1,
  })
end
