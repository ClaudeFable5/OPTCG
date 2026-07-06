-- AUTO-GENERATED: ST07-001 / 샬롯 링링
-- rules_id=ST07-001 script_id=880001817 fingerprint=e82052e7c2a7cdfbc31c0f297deea91a9f13a5f3415e0085fa05c513c7c6cce9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST07-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_HAND]],
            player=[[YOU]],
            position=[[LIFE_TOP]],
          },
        },
        conditions={
          {
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【어택 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 자신의 라이프가 2장 이하인 경우, 자신의 패를 1장까지 라이프 맨 위에 더한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST07-001]],
    schema_version=1,
  })
end
