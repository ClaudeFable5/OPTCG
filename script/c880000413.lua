-- AUTO-GENERATED: OP03-047 / 제프
-- rules_id=OP03-047 script_id=880000413 fingerprint=5361566d6ad54945bd12e02c33e70b56dfce070e67c70608299cf994eef4634e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=7,
            mode=[[OPTIONAL]],
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터의 어택으로 상대의 라이프에 대미지를 주었을 때, 자신의 덱 위에서 7장을 트래시에 놓을 수 있다.]],
        timings={
          [[ON_DAMAGE_TO_OPPONENT_LIFE]],
        },
      },
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
          {
            count=2,
            mode=[[OPTIONAL]],
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】코스트 3 이하인 캐릭터를 1장까지 주인의 패로 되돌리고 자신의 덱 위에서 2장을 트래시에 놓을 수 있다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-047]],
    schema_version=1,
  })
end
