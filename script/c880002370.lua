-- AUTO-GENERATED: OP15-068 / 신병
-- rules_id=OP15-068 script_id=880002370 fingerprint=be9a6fe1d42fccc7aa71aabea44f859a151430e08890dc71a0f409d0d374ef13
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-068]],
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
            count=6,
            op=[[FIELD_DON_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 필드의 두웅!!이 6장 이하인 경우, 이 캐릭터는 【블로커】를 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-068]],
    schema_version=1,
  })
end
