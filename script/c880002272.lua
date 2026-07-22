-- AUTO-GENERATED: OP14-107 / 샤쿠야쿠
-- rules_id=OP14-107 script_id=880002272 fingerprint=405e1d349a5302bf8b29eafe3a4efca076a6837150d3ca808e3b0a3d0cf80f27
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-107]],
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
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=3,
            op=[[LIFE_LTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 라이프가 3장 이하인 경우, 카드를 2장 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[구사 해적단]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《구사 해적단》 특징을 가진 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-107]],
    schema_version=1,
  })
end
