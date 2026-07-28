-- AUTO-GENERATED: OP15-113 / 롤로노아 조로
-- rules_id=OP15-113 script_id=880002415 fingerprint=4498edcadd0e2c53f60f63debe816cf9335fd13b75150cc409b435fce0fd3dd8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-113]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 자신의 덱 위에서 1장까지를 라이프 맨 위에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-113]],
    schema_version=1,
  })
end
