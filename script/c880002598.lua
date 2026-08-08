-- MANUAL: OP16-041 / 버기 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-041]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              name=[[임펠다운 수인]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        optional=true,
        trait=[[임펠 다운]],
        source_text=[[【두웅!!×1】【턴 1회】 자신의 특징 《임펠 다운》을 가진 캐릭터가 필드를 벗어났을 때, 발동할 수 있다. 자신의 패에서 「임펠다운 수인」 1장까지를 등장시킨다.]],
        timings={
          [[ON_OWN_TRAIT_CHARACTER_LEFT_BY_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-041]],
    schema_version=1,
  })
end
