-- AUTO-GENERATED: OP12-017 / 견문색 패기
-- rules_id=OP12-017 script_id=880001470 fingerprint=068539e3372ee78420f34e59b56ffa6e570677375d6784e754582e28b30b558e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  card_type=[[EVENT]],
                  color=[[RED]],
                },
                {
                  card_type=[[CHARACTER]],
                  cost_gte=3,
                },
              },
            },
            look_count=4,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                name=[[실버즈 레일리]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            state=[[ACTIVE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 「실버즈 레일리」 1장에게 액티브 상태인 두웅!! 1장을 부여할 수 있다: 자신의 덱 위에서 4장을 보고, 적색 이벤트 또는 코스트 3 이상인 캐릭터 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-017]],
    schema_version=1,
  })
end
