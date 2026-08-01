-- AUTO-GENERATED PROMO: P-075 / 몽키 D. 루피
-- rules_id=P-075 script_id=880002503
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-075]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더 또는 캐릭터 1장에 레스트 상태인 두웅!! 1장까지를 부여한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            filter={
              cost_gte=8,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 필드에 코스트 8 이상인 캐릭터가 있을 경우, 카드를 1장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-075]],
    schema_version=1,
  })
end
