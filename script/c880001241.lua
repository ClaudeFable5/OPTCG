-- AUTO-GENERATED: OP10-026 / 킨에몬
-- rules_id=OP10-026 script_id=880001241 fingerprint=f429bfa7a4c0cf8ffdaccc757231fce49a6596d4a447b791ab200229e627a7c2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_eq=6,
              name=[[킨에몬]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            op=[[RETURN_SELF_TO_DECK_BOTTOM]],
          },
          {
            count=1,
            filter={
              name=[[킨에몬]],
              power_eq=0,
            },
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터와 자신의 트래시에서 파워 0인 「킨에몬」 1장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 자신의 패에서 코스트 6인 「킨에몬」을 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-026]],
    schema_version=1,
  })
end
