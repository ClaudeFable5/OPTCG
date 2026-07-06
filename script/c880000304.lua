-- AUTO-GENERATED: OP02-059 / 보아 행콕
-- rules_id=OP02-059 script_id=880000304 fingerprint=b5c7e007e83dfbc9e2d02fc789d646b05cd79354df50fe1c2ecdac9862f0668f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-059]],
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
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
          {
            count=3,
            mode=[[UP_TO]],
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】카드를 1장 뽑고 자신의 패 1장을 버린다. 그 후, 자신의 패를 3장까지 버린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-059]],
    schema_version=1,
  })
end
