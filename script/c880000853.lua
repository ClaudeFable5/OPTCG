-- AUTO-GENERATED: OP06-119 / 상디
-- rules_id=OP06-119 script_id=880000853 fingerprint=cca245d1067b3145b962e43d3379142af0a9b9e3fcfc0bc590b691bd3c3c4318
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-119]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_lte=9,
              name_neq=[[상디]],
            },
            look_count=1,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
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
        source_text=[[【등장 시】자신의 덱 위에서 1장을 공개하고 「상디」 이외의 코스트 9 이하인 캐릭터를 1장까지 등장시킨다. 그 후, 남은 카드를 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-119]],
    schema_version=1,
  })
end
