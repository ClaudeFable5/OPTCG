-- AUTO-GENERATED: OP13-051 / 보아 행콕
-- rules_id=OP13-051 script_id=880001623 fingerprint=cc49bac885405b5c7a84d67729360e10564ed845bdf49d0e7650a3c3060a6ba2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-051]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            allow_multicolor=true,
            names={
              [[보아 행콕]],
            },
            op=[[LEADER_NAME_IS_ANY]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 「보아 행콕」 또는 다색인 경우, 카드를 2장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-051]],
    schema_version=1,
  })
end
