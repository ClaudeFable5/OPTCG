-- AUTO-GENERATED: OP11-091 / 베리굿
-- rules_id=OP11-091 script_id=880001425 fingerprint=3a1627b6cd3f5805d0c60e705726c943f77ceaad4e521933714b5153c8dcc967
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-091]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            filter={
              card_type=[[EVENT]],
            },
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대는 자신의 트래시에서 이벤트 3장을 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-091]],
    schema_version=1,
  })
end
