-- AUTO-GENERATED: OP13-045 / 하루타
-- rules_id=OP13-045 script_id=880001617 fingerprint=7ce550bcd54143348eadb962d5e1e24115d427076a6aaf7adbc0152bc713621c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=4,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패가 4장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-045]],
    schema_version=1,
  })
end
