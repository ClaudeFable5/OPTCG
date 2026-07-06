-- AUTO-GENERATED: OP09-107 / 니코 로빈
-- rules_id=OP09-107 script_id=880001203 fingerprint=44d0732d24d61c731e9593891e87d3163829858b2a05eeb71bce981c4d1bdbc1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-107]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TRASH_LIFE_TOP]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=3,
            op=[[LIFE_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 라이프가 3장 이상인 경우, 상대의 라이프 위에서 1장까지를 트래시로 보낸다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[YELLOW]],
              cost_lte=3,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 패에서 코스트 3 이하인 황색 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-107]],
    schema_version=1,
  })
end
