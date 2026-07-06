-- AUTO-GENERATED: OP08-105 / 쥬얼리 보니
-- rules_id=OP08-105 script_id=880001081 fingerprint=4be77b435e1eff2a96759f6aa7846e3b5cd7b5bac346801f14f1408346dbea0c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-105]],
    compile_status=[[AUTO]],
    effects={
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
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【자신의 턴 동안】【턴 1회】상대의 라이프가 줄어들었을 때, 카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_OPPONENT_LIFE_DECREASED]],
        },
      },
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
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-105]],
    schema_version=1,
  })
end
