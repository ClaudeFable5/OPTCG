-- AUTO-GENERATED: EB03-054 / 니코 로빈
-- rules_id=EB03-054 script_id=880002157 fingerprint=3ccd4c8a273553552c14c2b8825d8841cd576a463903aa56ebb7e97ae7435869
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-054]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_LIFE_TOP]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위에서 1장을 트래시에 놓을 수 있다: 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 패 1장을 버릴 수 있다: 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-054]],
    schema_version=1,
  })
end
