-- AUTO-GENERATED: OP03-037 / 이빨물어뜯기
-- rules_id=OP03-037 script_id=880000403 fingerprint=648250297d6bfc2ec0fad3100e31eb21b9ee2d8ee1afe634ab5f0b2632ba8e2c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-037]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
                state=[[RESTED]],
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
            filter={
              trait=[[이스트 블루]],
            },
            kinds={
              [[CHARACTER]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 《이스트 블루》 특징을 가진 캐릭터 1장을 레스트할 수 있다: 상대의 레스트 상태이고 코스트 3 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              has_trigger=true,
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
        source_text=[[자신의 패에서 코스트 4 이하인 【트리거】를 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-037]],
    schema_version=1,
  })
end
