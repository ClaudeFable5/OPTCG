-- AUTO-GENERATED: OP07-050 / 보아 썬더소니아
-- rules_id=OP07-050 script_id=880000905 fingerprint=bb20f37cbf7f42f093e5f44b0b6c6bf92eeadca4d9fb7f5a1398e6ed09bc289f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-050]],
    compile_status=[[AUTO]],
    effects={
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
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            count=2,
            filter={
              trait_any={
                [[아마존 릴리]],
                [[구사 해적단]],
              },
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드에 《아마존 릴리》 또는 《구사 해적단》 특징을 가진 캐릭터가 2장 이상인 경우, 상대의 코스트 3 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-050]],
    schema_version=1,
  })
end
