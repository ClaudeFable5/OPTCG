-- AUTO-GENERATED PROMO: P-113 / 쥬얼리 보니
-- rules_id=P-113 script_id=880002526
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-113]],
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
          {
            amount=2000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【상대의 턴 동안】이 캐릭터는 【블로커】를 얻고, 파워 +2000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-113]],
    schema_version=1,
  })
end
