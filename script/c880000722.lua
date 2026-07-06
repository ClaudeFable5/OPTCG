-- AUTO-GENERATED: OP05-109 / 파가야
-- rules_id=OP05-109 script_id=880000722 fingerprint=101d77311989d8b360bc0e8154b3e8541ca67d0f274d2db5a077a4ac4f73a832
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-109]],
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
            op=[[LIFE_TRIGGER_ACTIVATED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】【트리거】가 발동했을 때, 카드를 2장 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[ON_LIFE_TRIGGER_ACTIVATED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-109]],
    schema_version=1,
  })
end
