-- AUTO-GENERATED: OP08-052 / 포트거스 D. 에이스
-- rules_id=OP08-052 script_id=880001028 fingerprint=cd0a431580b285442c5d708d42987edb7a2f0ceddd42ca76f2f3ae98540b9283
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-052]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait_contains=[[흰 수염 해적단]],
            },
            look_count=1,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            rest_order=[[CHOOSE]],
            rested=false,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 1장을 공개하고, 코스트 4 이하인 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터 카드를 1장까지 등장시킨다. 그 후, 남은 카드를 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-052]],
    schema_version=1,
  })
end
