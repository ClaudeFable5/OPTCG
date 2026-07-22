-- AUTO-GENERATED: OP14-052 / 한냐발
-- rules_id=OP14-052 script_id=880002217 fingerprint=ddc49c3c355f3177cb4ebd73d35d1062dbaa6d25fe36837c371ca3f0bbb69a1b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-052]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=6,
              trait=[[임펠 다운]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 3장을 버릴 수 있다: 자신의 패에서 코스트 6 이하인 《임펠 다운》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP14-052]],
    schema_version=1,
  })
end
