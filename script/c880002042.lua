-- AUTO-GENERATED: P-048 / 아론
-- rules_id=P-048 script_id=880002042 fingerprint=38f204979ca1e94d1d08ff0f45e6b97aef788b297aa8227f35b07e97b4d67e1d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
            player=[[OPPONENT]],
            positions={
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={
          {
            count=4,
            op=[[LIFE_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 라이프가 4장 이상인 경우, 상대는 자신의 패 1장을 덱 맨 아래로 되돌린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-048]],
    schema_version=1,
  })
end
