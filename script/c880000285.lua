-- AUTO-GENERATED: OP02-040 / 브룩
-- rules_id=OP02-040@29a3a48c028c script_id=880000285 fingerprint=29a3a48c028ca66690b97c63e87900c0e328bc0d4fc2170e4123598bc7b810ed
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-040]],
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
                [[FILM]],
                [[밀짚모자 일당]],
              },
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
        source_text=[[【등장 시】자신의 패에서 코스트 3 이하인 《FILM》 또는 《밀짚모자 일당》 특징을 가진 캐릭터를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-040@29a3a48c028c]],
    schema_version=1,
  })
end
