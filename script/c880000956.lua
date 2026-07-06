-- AUTO-GENERATED: OP07-101 / 샤카
-- rules_id=OP07-101 script_id=880000956 fingerprint=28dc122fce3e89ce9a4c48ef38c0a7abc5dd4fc3d78c6a8a0921c892c448c23c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-101]],
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
            name=[[베가펑크]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 「베가펑크」인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP07-101]],
    schema_version=1,
  })
end
