-- AUTO-GENERATED: OP14-116 / 샐러맨더
-- rules_id=OP14-116 script_id=880002281 fingerprint=f151c4390d59299715314251531bbbdb74fb3ee6372c4c3b119430c69ea805e5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-116]],
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
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait_any={
                [[아마존 릴리]],
                [[구사 해적단]],
              },
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +2000. 그 후, 자신의 패에서 코스트 4 이하인 《아마존 릴리》나 《구사 해적단》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[COUNTER]],
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
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-116]],
    schema_version=1,
  })
end
