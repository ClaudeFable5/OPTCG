-- AUTO-GENERATED: OP06-110 / 네코마무시
-- rules_id=OP06-110 script_id=880000844 fingerprint=eef59eea3ae40fc96a10ff7ecd31f90283097ac77c00299300e93f7a94f39bea
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-110]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[ALLOW_ATTACK_ACTIVE_CHARACTER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】이 캐릭터는 상대의 액티브 상태인 캐릭터도 어택할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            count=3,
            op=[[LIFE_LTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 라이프가 3장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-110]],
    schema_version=1,
  })
end
