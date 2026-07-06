-- AUTO-GENERATED: ST10-014 / 와이어
-- rules_id=ST10-014 script_id=880001874 fingerprint=78af644a2573d195e6bb9932a63f2c8657048f352726855897f04242c8e2e3a9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST10-014]],
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
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신 필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 카드 1장을 뽑고 패 1장을 버린다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST10-014]],
    schema_version=1,
  })
end
