-- AUTO-GENERATED: OP14-014 / 유스타스 키드
-- rules_id=OP14-014 script_id=880002179 fingerprint=529c30c6d84c3b0727cc235db083cb6017170ef679310c2ceca27a1bb34dcc80
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              base_power_lte=2000,
              card_type=[[CHARACTER]],
              color=[[RED]],
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
            trait=[[초신성]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《초신성》 특징을 가진 경우, 자신의 패에서 파워가 2000 이하인 적색 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP14-014]],
    schema_version=1,
  })
end
