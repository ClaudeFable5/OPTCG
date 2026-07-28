-- AUTO-GENERATED: ST29-009 / 니코 로빈
-- rules_id=ST29-009 script_id=880002294 fingerprint=222bc62d01800c1dc51b4d3c3ba0fb837d1d53e369003d9506ff2618fadd9d93
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[몽키 D. 루피]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】자신의 리더가 「몽키 D. 루피」인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST29-009]],
    schema_version=1,
  })
end
