-- AUTO-GENERATED: OP15-109 / 니코 로빈
-- rules_id=OP15-109 script_id=880002411 fingerprint=7b43a696f7bf02625fba3508010e25838d9bd713e43cd9a0a9ae3721d128dbac
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-109]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              trait=[[하늘섬]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밀짚모자 일당]],
          },
        },
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위에서 1장을 패에 넣을 수 있다: 자신의 리더가 《밀짚모자 일당》 특징을 가진 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 놓는다. 그 후, 자신의 패에서 코스트 5 이하인 《하늘섬》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-109]],
    schema_version=1,
  })
end
