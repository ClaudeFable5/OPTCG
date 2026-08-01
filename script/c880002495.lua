-- AUTO-GENERATED PROMO: P-065 / 토니토니 쵸파
-- rules_id=P-065 script_id=880002495
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-065]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
            op=[[MODIFY_POWER]],
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
              cost_lte=0,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】상대의 코스트 0인 캐릭터가 있는 경우, 다음 자신의 턴 개시 시까지 이 캐릭터의 파워 +2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-065]],
    schema_version=1,
  })
end
