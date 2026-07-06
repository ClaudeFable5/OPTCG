-- AUTO-GENERATED: OP04-011 / 나미
-- rules_id=OP04-011 script_id=880000501 fingerprint=3054dc7d9be783a0d3103374adc02b6ab18b884c578518aa21b02c7278694c3a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_gte=6000,
            },
            on_match={
              {
                amount=3000,
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
            op=[[REVEAL_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 덱 위에서 1장을 공개하고, 공개한 카드가 파워 6000 이상인 캐릭터 카드였을 경우, 이번 턴 동안, 이 캐릭터의 파워 +3000. 그 후, 공개한 카드를 덱 맨 아래로 되돌린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-011]],
    schema_version=1,
  })
end
