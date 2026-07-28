-- AUTO-GENERATED: OP15-119 / 몽키 D. 루피
-- rules_id=OP15-119 script_id=880002421 fingerprint=10b1dcdff5c3c72468ea35cb3ed937ec18cc4dbcacf1e3fc3409751f8774cd7b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-119]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[RUSH]],
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
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 필드의 두웅!!이 6장 이상 있는 경우, 이 캐릭터는 【속공】을 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            amount=1000,
            count=1,
            duration=[[THIS_TURN]],
            op=[[REVEAL_LIFE_TOP_FOR_POWER]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[상대가 이벤트나 【블로커】를 발동했을 때, 자신의 라이프 위에서 1장까지를 공개한다. 공개한 카드의 코스트 1당 이 캐릭터는 이번 턴 동안 파워 +1000.]],
        timings={
          [[ON_OPPONENT_BLOCKER_OR_EVENT_ACTIVATED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-119]],
    schema_version=1,
  })
end
