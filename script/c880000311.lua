-- AUTO-GENERATED: OP02-066 / 임펠 다운 올스타
-- rules_id=OP02-066 script_id=880000311 fingerprint=ef4c380fa4bce962727017c5ac373687187dae97a38f6c5e74ee56b32ca239f4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-066]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[임펠 다운]],
          },
        },
        costs={
          {
            count=2,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 패 2장을 버릴 수 있다: 자신의 리더가 《임펠 다운》 특징을 가진 경우, 카드를 2장까지 뽑는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 2장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-066]],
    schema_version=1,
  })
end
