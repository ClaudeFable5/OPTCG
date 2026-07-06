-- AUTO-GENERATED: EB01-050 / 살고 싶어!!!
-- rules_id=EB01-050 script_id=880000049 fingerprint=32402eaa64ca691501c5e7425b0c76b2f3b11504b1bd3ef81f8136630b657724
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-050]],
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
        conditions={
          {
            count=30,
            op=[[TRASH_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 트래시가 30장 이상인 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-050]],
    schema_version=1,
  })
end
