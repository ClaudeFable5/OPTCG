-- AUTO-GENERATED: ST12-017 / 정형 쇼트
-- rules_id=ST12-017 script_id=880001899 fingerprint=46fe05b0e59024c519f91088c27d2842a599e0ca3ec273ba347741c525a278da
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST12-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
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
              card_type=[[CHARACTER]],
              cost_eq=2,
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
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +2000. 그 후, 자신의 덱 위에서 1장을 공개하고, 코스트 2인 캐릭터 카드를 1장까지 등장시킨다. 그 후, 남은 카드를 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST12-017]],
    schema_version=1,
  })
end
