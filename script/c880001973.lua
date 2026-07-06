-- AUTO-GENERATED: ST22-016 / 취소해라…!!! 방금 그 말……!!!
-- rules_id=ST22-016 script_id=880001973 fingerprint=3b317f8c00b3ff9f7f5c3d26aa12c80ec3131512335fd9b03bcf84715fb69b1e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST22-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              trait_contains=[[흰 수염 해적단]],
            },
            on_match={
              {
                amount=4000,
                duration=[[THIS_BATTLE]],
                op=[[MODIFY_POWER]],
                selector={
                  count=1,
                  kind=[[LEADER_OR_CHARACTER]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 덱 위에서 1장을 공개하고, 그 카드가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +4000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST22-016]],
    schema_version=1,
  })
end
