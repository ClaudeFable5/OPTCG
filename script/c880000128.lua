-- AUTO-GENERATED: OP01-005 / 우타
-- rules_id=OP01-005 script_id=880000128 fingerprint=4d4ec769d21fb4ff0d79c3331ef3d3f2570588716357ed208c7abb12479d3f8e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              color=[[RED]],
              cost_lte=3,
              name_neq=[[우타]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】 자신의 트래시에서 「우타」이외의 코스트 3 이하인 적색 캐릭터 카드를 1장까지 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-005]],
    schema_version=1,
  })
end
