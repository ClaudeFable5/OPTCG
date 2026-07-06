-- AUTO-GENERATED: OP09-109 / 하그왈 D. 사우로
-- rules_id=OP09-109 script_id=880001205 fingerprint=66f405fcdb00faa2e9e9eebc3a2c6f3acc3b284da84c43c4ffba3859fc4945f6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-109]],
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
            name=[[니코 로빈]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 「니코 로빈」인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP09-109]],
    schema_version=1,
  })
end
