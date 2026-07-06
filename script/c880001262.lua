-- AUTO-GENERATED: OP10-047 / 코알라
-- rules_id=OP10-047 script_id=880001262 fingerprint=f79df90fede29b2756ef7c57a39dbd4c00133a757949fb8f288579947941e298
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-047]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_OWN_CARD_TO_HAND]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                cost_gte=3,
                trait=[[혁명군]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 코스트 3 이상인 《혁명군》 특징을 가진 캐릭터 1장을 주인의 패로 되돌릴 수 있다: 이번 턴 동안, 이 캐릭터의 파워 +3000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-047]],
    schema_version=1,
  })
end
