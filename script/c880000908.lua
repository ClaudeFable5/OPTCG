-- AUTO-GENERATED: OP07-053 / 포트거스 D. 에이스
-- rules_id=OP07-053 script_id=880000908 fingerprint=7a775559342e62dc7a895ad1c6af052af3d2de41a1fb7b7ea4803e7172dc2d21
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-053]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
            player=[[YOU]],
            positions={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 2장 뽑고, 자신의 패 2장을 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP07-053]],
    schema_version=1,
  })
end
