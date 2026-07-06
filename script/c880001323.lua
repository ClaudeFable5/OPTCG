-- AUTO-GENERATED: OP10-108 / 스크래치멘 아푸
-- rules_id=OP10-108 script_id=880001323 fingerprint=a5274208d2a03e55da6fb5ee49e1b448b42a203d03d635cc9c600d93fb61bcdc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-108]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              color=[[YELLOW]],
              name_neq=[[스크래치멘 아푸]],
              trait=[[초신성]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[「스크래치멘 아푸」 이외의 자신의 황색인 《초신성》 특징을 가진 캐릭터가 있을 경우, 이 캐릭터는 【블로커】를 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-108]],
    schema_version=1,
  })
end
