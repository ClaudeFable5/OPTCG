-- AUTO-GENERATED: OP06-086 / 겟코 모리아
-- rules_id=OP06-086 script_id=880000820 fingerprint=d9eecc4f3e02560cef1a774518afa3b3af2038753e30431305bbdae4c2088272
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-086]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            active_count=1,
            first_count=1,
            first_filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
            },
            op=[[PLAY_TWO_FROM_TRASH_SPLIT_STATE]],
            player=[[YOU]],
            second_count=1,
            second_filter={
              card_type=[[CHARACTER]],
              cost_lte=2,
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 코스트 4 이하인 캐릭터 카드 1장까지와 코스트 2 이하인 캐릭터 카드를 1장까지 선택해 1장을 등장시키고 나머지는 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-086]],
    schema_version=1,
  })
end
