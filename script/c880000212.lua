-- AUTO-GENERATED: OP01-089 / 초승달 사구
-- rules_id=OP01-089 script_id=880000212 fingerprint=1e686ed62586f94de96a628bbc561b8627ae2ab05f4836685c2f00c1ea1e96b8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-089]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[왕의 부하 칠무해]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】 자신의 리더가 《왕의 부하 칠무해》 특징을 가진 경우, 코스트 5 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-089]],
    schema_version=1,
  })
end
