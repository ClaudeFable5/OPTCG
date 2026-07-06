-- AUTO-GENERATED: OP10-104 / 카리브
-- rules_id=OP10-104 script_id=880001319 fingerprint=65c548ef04fa8177d2d97ab906d1026f6738e55036be36b46521651e2dc08232
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-104]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[BATTLE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[초신성]],
          },
          {
            count=3,
            op=[[LIFE_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】자신의 리더가 《초신성》 특징을 가지고, 상대의 라이프가 3장 이상인 경우, 이 캐릭터는 배틀에서는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-104]],
    schema_version=1,
  })
end
