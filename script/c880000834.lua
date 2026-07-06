-- AUTO-GENERATED: OP06-100 / 이누아라시
-- rules_id=OP06-100 script_id=880000834 fingerprint=6adfda8dd252b452c427a69d0b6c7a0eab08d9e39c0dcda83ad22919b921c3df
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-100]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte_life_of=[[OPPONENT]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【어택 시】자신의 패 1장을 버릴 수 있다: 상대의 라이프 수 이하의 코스트를 가진 상대의 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
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
    rules_id=[[OP06-100]],
    schema_version=1,
  })
end
