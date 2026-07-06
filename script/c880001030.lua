-- AUTO-GENERATED: OP08-054 / 다짜고짜 '킹'을 잡을 수야 없지
-- rules_id=OP08-054 script_id=880001030 fingerprint=7148c86327da97b99688dc78400f4bd3c0fe8c1f0fa2d70d871ac11211b1b135
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-054]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            filter={
              cost_lte=3,
              trait_contains=[[흰 수염 해적단]],
            },
            look_count=1,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            rest_order=[[CHOOSE]],
            rested=false,
            select_count=1,
            select_mode=[[UP_TO]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +3000. 그 후, 자신의 덱 위에서 1장을 공개하고, 코스트 3 이하인 『흰 수염 해적단』을 포함한 특징을 가진 카드를 1장까지 등장시킨다. 그 후, 남은 카드를 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-054]],
    schema_version=1,
  })
end
