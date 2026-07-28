-- AUTO-GENERATED: OP15-087 / 니코 로빈
-- rules_id=OP15-087 script_id=880002389 fingerprint=34180469bf12fc395ee5e9e8a20a6267b5005c61ce53551afe5578748dafc0f4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-087]],
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
            count=10,
            op=[[TRASH_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 트래시가 10장 이상인 경우, 이 캐릭터는 【블로커】를 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 2장 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-087]],
    schema_version=1,
  })
end
