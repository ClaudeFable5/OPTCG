-- AUTO-GENERATED: OP15-103 / 겐보우
-- rules_id=OP15-103 script_id=880002405 fingerprint=23ffc93c44d2b9f934e70a6ea13e424ef71d012981db793da883fe82cbf3e1c2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-103]],
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
                count=2,
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
        source_text=[[【트리거】카드를 1장 뽑는다. 그 후, 자신의 라이프가 2장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-103]],
    schema_version=1,
  })
end
