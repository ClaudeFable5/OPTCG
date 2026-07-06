-- AUTO-GENERATED: OP09-106 / 니코 올비아
-- rules_id=OP09-106 script_id=880001202 fingerprint=edc13ebf27f551150b98fedfdc1a027b7409a8a124152bff6bb17620a44787e9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-106]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name=[[니코 로빈]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 리더인 「니코 로빈」 1장까지의 파워 +3000.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=3,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            name=[[니코 로빈]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 「니코 로빈」인 경우, 카드를 3장 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-106]],
    schema_version=1,
  })
end
