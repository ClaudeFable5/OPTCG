-- AUTO-GENERATED: ST22-012 / 마르코
-- rules_id=ST22-012 script_id=880001969 fingerprint=8c310d0a6ada0fe7fdc2c19892cf6fe187d79cc3dcdffea17e1f7c6e6ad3eb3a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST22-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=1,
                op=[[TRASH_HAND]],
              },
            },
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
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】이 캐릭터가 상대의 효과로 KO 당할 경우, 대신 자신의 패 1장을 버릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              trait_contains=[[흰 수염 해적단]],
            },
            on_match={
              {
                amount=1000,
                duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
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
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 덱 위에서 1장을 공개하고, 그 카드가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 다음 상대의 턴 종료 시까지, 이 캐릭터의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST22-012]],
    schema_version=1,
  })
end
