-- AUTO-GENERATED: OP03-104 / 셜리
-- rules_id=OP03-104 script_id=880000470 fingerprint=51fcca238ecab25856de70b537b7cfc0c9943678f06e84998b59dce15d24d190
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-104]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destinations={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            mode=[[UP_TO]],
            op=[[LOOK_REORDER_LIFE_TOP]],
            player=[[ANY]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 또는 상대의 라이프 위에서 1장까지를 보고, 라이프 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP03-104]],
    schema_version=1,
  })
end
