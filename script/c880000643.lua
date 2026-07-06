-- AUTO-GENERATED: OP05-031 / 버팔로
-- rules_id=OP05-031 script_id=880000643 fingerprint=be7e7dc5666021ca478ed278c4b5c98100ff35c870598cbd9d560b3c50319e0c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_eq=1,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=2,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【어택 시】【턴 1회】자신의 레스트 상태인 캐릭터가 2장 이상인 경우, 자신의 레스트 상태이고 코스트 1인 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-031]],
    schema_version=1,
  })
end
