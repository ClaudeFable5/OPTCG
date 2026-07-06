-- AUTO-GENERATED: EB02-055 / 징베
-- rules_id=EB02-055 script_id=880000117 fingerprint=208d071be30b63c6b2b540bd74c8bd114af95b6feb58f1a2800e82ec0c47bf52
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT_ANY]],
            player=[[YOU]],
            traits={
              [[어인족]],
              [[인어족]],
            },
          },
          {
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《어인족》 또는 《인어족》 특징을 가지고, 자신의 라이프가 2장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-055]],
    schema_version=1,
  })
end
