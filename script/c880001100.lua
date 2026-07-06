-- AUTO-GENERATED: OP09-005 / 실버즈 레일리
-- rules_id=OP09-005 script_id=880001100 fingerprint=6f5638d305cb0a894f683cb4a9132d56a78b5071fd9b0c56d346b965ea8077fe
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=2,
                op=[[DRAW]],
                player=[[YOU]],
              },
              {
                count=1,
                op=[[TRASH_HAND]],
                player=[[YOU]],
                ["then"]=true,
              },
            },
            conditions={
              {
                count=2,
                filter={
                  base_power_gte=5000,
                },
                op=[[CHARACTER_COUNT_GTE]],
                player=[[OPPONENT]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 원래 파워가 5000 이상인 캐릭터가 2장 이상인 경우, 카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP09-005]],
    schema_version=1,
  })
end
