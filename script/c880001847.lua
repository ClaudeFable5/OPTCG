-- AUTO-GENERATED: ST08-014 / 고무고무 종
-- rules_id=ST08-014 script_id=880001847 fingerprint=aabb370912f2106ed7c49dd1628fe797d61a0bc5a28683f33288bc58314f46c9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST08-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-7,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
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
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 라이프 위에서 1장을 패에 더 할 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -7.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              color=[[BLACK]],
              cost_lte=2,
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 트래시에서 코스트 2 이하인 흑색 캐릭터 카드를 1장까지 패에 더한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST08-014]],
    schema_version=1,
  })
end
