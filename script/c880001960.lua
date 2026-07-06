-- AUTO-GENERATED: ST22-003 / 에드워드 뉴게이트
-- rules_id=ST22-003 script_id=880001960 fingerprint=bc2e740afc2e78dc8b3f5a44aa20cacb905acc72a764fb8d9d9f3f2cf6fa41d5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST22-003]],
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
                count=2,
                op=[[DRAW]],
                player=[[YOU]],
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
        source_text=[[【등장 시】자신의 덱 위에서 1장을 공개하고, 그 카드가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[DOUBLE_ATTACK]],
    },
    rules_id=[[ST22-003]],
    schema_version=1,
  })
end
