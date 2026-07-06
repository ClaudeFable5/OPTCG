-- AUTO-GENERATED: OP07-107 / 프랑키
-- rules_id=OP07-107 script_id=880000962 fingerprint=ae94ecfb76e28192f559cdce7095e58f8ca012c689b1d0562949db774c2c7d38
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-107]],
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
            actions={
              {
                op=[[PLAY_SELF]],
                rested=false,
              },
            },
            conditions={
              {
                count=1,
                op=[[LIFE_LTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑는다. 그 후, 자신의 라이프가 1장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-107]],
    schema_version=1,
  })
end
