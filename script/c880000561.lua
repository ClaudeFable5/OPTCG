-- AUTO-GENERATED: OP04-069 / Mr.2 봉쿠레(벤담)
-- rules_id=OP04-069 script_id=880000561 fingerprint=fd997c554aa40da1cd18ef32bccf29341891e9714feda876a68cd0069ba053e4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-069]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[SET_BASE_POWER_FROM_TARGET]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source_selector={
              count=1,
              kind=[[BATTLE_ATTACKER]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 어택 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 이번 턴 동안, 이 캐릭터의 원래 파워는 상대의 어택하고 있는 리더 또는 캐릭터와 동일한 파워가 된다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
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
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[두웅!!-1: 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-069]],
    schema_version=1,
  })
end
