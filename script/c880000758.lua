-- AUTO-GENERATED: OP06-024 / 이카로스 뭇히
-- rules_id=OP06-024 script_id=880000758 fingerprint=c96ca2b97f37e4f34d42742e8ddadba109c4ae19764ea629c619065ce596b16a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[어인족]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[신 어인 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《신 어인 해적단》 특징을 가진 경우, 자신의 패에서 코스트 4 이하인 《어인족》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다. 그 후, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-024]],
    schema_version=1,
  })
end
