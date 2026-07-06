-- AUTO-GENERATED: EB02-045 / 트라팔가 로
-- rules_id=EB02-045 script_id=880000107 fingerprint=8decef3fefb1752f3a2443890b58ff536a5acd70273942651ab2c616b58ebf88
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            option_conditions={
              {},
              {
                {
                  count=5,
                  op=[[HAND_GTE]],
                  player=[[OPPONENT]],
                },
              },
            },
            options={
              {
                {
                  count=1,
                  op=[[DRAW]],
                  player=[[YOU]],
                },
              },
              {
                {
                  count=1,
                  op=[[TRASH_HAND]],
                  player=[[OPPONENT]],
                },
              },
            },
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 아래에서 하나를 선택한다.
・카드를 1장 뽑는다.
・상대의 패가 5장 이상인 경우, 상대는 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB02-045]],
    schema_version=1,
  })
end
