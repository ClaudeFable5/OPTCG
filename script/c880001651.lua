-- AUTO-GENERATED: OP13-079 / 이무
-- rules_id=OP13-079 script_id=880001651 fingerprint=46dfc7943b2d31dc9244be417de684c8e5ea8f15013470d762c9480c742d6272
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-079]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[RULE]],
            forbidden_filter={
              card_type=[[EVENT]],
              cost_gte=2,
            },
            op=[[DECK_BUILD_RESTRICTION]],
            player=[[YOU]],
          },
          {
            count=1,
            filter={
              card_type=[[STAGE]],
              trait=[[성지 마리조아]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_DECK]],
            player=[[YOU]],
            rested=false,
            timing=[[GAME_START]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[룰상, 자신은 코스트 2 이상인 이벤트를 덱에 넣을 수 없으며 게임 개시 시, 자신의 덱에서 《성지 마리조아》 특징을 가진 스테이지 카드를 1장까지 등장시킨다.]],
        timings={
          [[RULE]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[천룡인]],
            },
            hand_filter={},
            op=[[TRASH_CHARACTER_OR_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 《천룡인》 특징을 가진 캐릭터 또는 패 1장을 트래시에 놓을 수 있다: 카드를 1장 뽑는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-079]],
    schema_version=1,
  })
end
