-- AUTO-GENERATED: OP08-104 / 샬롯 푸아르
-- rules_id=OP08-104 script_id=880001080 fingerprint=98a1f3465f07d2a756d34ee038c146332f687df2b0356255a623df1ea10d3f76
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-104]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 패 1장을 버릴 수 있다: 이 카드를 등장시킨다. 그 후, 카드를 1장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-104]],
    schema_version=1,
  })
end
