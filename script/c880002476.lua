-- AUTO-GENERATED: EB04-055 / 바솔로뮤 쿠마
-- rules_id=EB04-055 script_id=880002476 fingerprint=56d04b9cc23cc5978445a344dbea2417cdbea584b0350e199f99307297d4d009
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[혁명군]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 코스트 4 이하인 《혁명군》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_KO]],
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
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[혁명군]],
          },
          {
            count=5,
            op=[[LIFE_TOTAL_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】자신의 리더가 《혁명군》 특징을 가지고, 서로의 라이프 합계가 5장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-055]],
    schema_version=1,
  })
end
