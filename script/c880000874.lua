-- AUTO-GENERATED: OP07-020 / 알라딘
-- rules_id=OP07-020 script_id=880000874 fingerprint=63beadd1cf19dc92dd1270e9b57eb67ca11550cbec21095dfda155a4dacd88a8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-020]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              trait_any={
                [[어인족]],
                [[인어족]],
              },
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[어인족]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 《어인족》 특징을 가진 경우, 자신의 패에서 코스트 3 이하인 《어인족》 또는 《인어족》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP07-020]],
    schema_version=1,
  })
end
