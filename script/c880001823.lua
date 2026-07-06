-- AUTO-GENERATED: ST07-007 / 샬롯 브륄레
-- rules_id=ST07-007 script_id=880001823 fingerprint=945ad9db05c682964344de193a1a1bc79312abac1953820930a3f67f2ea3b834
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST07-007]],
    compile_status=[[AUTO]],
    effects={
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
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST07-007]],
    schema_version=1,
  })
end
