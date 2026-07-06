-- AUTO-GENERATED: OP05-111 / 호토리
-- rules_id=OP05-111 script_id=880000724 fingerprint=14506d2cd53f0ee00739b446b8b0faed4541a3e30c024fd700d21620271e31a4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-111]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            faceup=true,
            op=[[ADD_TO_LIFE]],
            player=[[OPPONENT]],
            positions={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            selector={
              count=1,
              filter={
                cost_lte=3,
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
              card_type=[[CHARACTER]],
              name=[[코토리]],
            },
            op=[[PLAY_FROM_HAND]],
            rested=false,
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 「코토리」 1장을 등장시킬 수 있다: 상대의 코스트 3 이하인 캐릭터를 1장까지 상대의 라이프 맨 위나 아래에 앞면으로 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-111]],
    schema_version=1,
  })
end
