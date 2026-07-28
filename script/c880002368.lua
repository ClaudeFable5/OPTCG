-- AUTO-GENERATED: OP15-066 / 사토리
-- rules_id=OP15-066 script_id=880002368 fingerprint=983db30cec34e99e7cc328a8c4e1378d354b4215ea9e7da0aeb6ee883c177dfd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-066]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1: 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=2,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=6,
            op=[[FIELD_DON_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 필드의 두웅!!이 6장 이하인 경우, 자신의 덱 위에서 2장을 보고, 원하는 순서대로 덱 맨 위나 아래에 놓는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-066]],
    schema_version=1,
  })
end
