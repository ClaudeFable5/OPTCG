-- AUTO-GENERATED: OP02-064 / Mr.2 봉쿠레 (벤담)
-- rules_id=OP02-064 script_id=880000309 fingerprint=fe44556efcafb4943b15e292b6ade37c07a1fa12eb14b2422300b1d483aad968
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-064]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            schedule=[[THIS_BATTLE_END]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 패 1장을 버릴 수 있다: 코스트 2 이하인 캐릭터를 1장까지 주인의 덱 맨 아래로 되돌린다. 그 후, 이번 배틀 종료 시, 이 캐릭터를 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-064]],
    schema_version=1,
  })
end
