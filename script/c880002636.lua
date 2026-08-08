-- MANUAL: OP16-079 / 야마토 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-079]],
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
                trait=[[와노쿠니]],
              },
              kind=[[EVENT_TARGET]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[EVENT_PLAYED_FROM_TRASH]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 트래시에서 특징 《와노쿠니》를 가진 캐릭터가 등장했을 때, 그 캐릭터는 이번 턴 동안 【속공】을 얻는다.]],
        timings={
          [[ON_OWN_CHARACTER_PLAYED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-079]],
    schema_version=1,
  })
end
