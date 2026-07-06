-- AUTO-GENERATED: OP08-056 / 모비딕 호
-- rules_id=OP08-056 script_id=880001032 fingerprint=b05637370300138705cd0b60732899e493f041c04e5f963da46be0db71a3c356
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-056]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[RETURN_HAND_TO_DECK]],
            player=[[YOU]],
            positions={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[EVENT_TARGET_TRAIT_CONTAINS]],
            trait=[[흰 수염 해적단]],
          },
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신의 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터가 효과로 필드를 벗어났을 때, 카드를 1장 뽑는다. 그 후, 자신의 패 1장을 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_OWN_TRAIT_CHARACTER_LEFT_BY_EFFECT]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-056]],
    schema_version=1,
  })
end
