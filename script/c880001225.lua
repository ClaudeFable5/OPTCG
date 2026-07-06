-- AUTO-GENERATED: OP10-010 / 차드로스 히겔리게스(갈색수염)
-- rules_id=OP10-010 script_id=880001225 fingerprint=7361a91c5de8f4e0fb254f2c4d4c2c8b0a22ad88012e1319f085e5913a7e86a4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
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
            count=1,
            filter={
              power_gte=6000,
            },
            op=[[CHARACTER_COUNT_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 파워 6000 이상인 캐릭터가 1장 이하인 경우, 이번 턴 동안, 이 캐릭터의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-010]],
    schema_version=1,
  })
end
