-- AUTO-GENERATED: ST29-004 / 상디
-- rules_id=ST29-004 script_id=880002289 fingerprint=1f174bc8b566abed3e56434bc9069932bb7de78b750be95af9f8778c27b84959
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[밀짚모자 일당]],
            },
            look_count=4,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 4장을 보고, 《밀짚모자 일당》 특징을 가진 카드 1장까지를 공개하고 패에 넣는다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】자신의 패 1장을 버릴 수 있다: 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST29-004]],
    schema_version=1,
  })
end
