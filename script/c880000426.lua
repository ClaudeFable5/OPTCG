-- AUTO-GENERATED: OP03-060 / 칼리파
-- rules_id=OP03-060 script_id=880000426 fingerprint=fca0741c06415daee0330f47b32e1972432aff2a1943ee733d87c6022e5f5d8b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-060]],
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
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-060]],
    schema_version=1,
  })
end
