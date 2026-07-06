-- AUTO-GENERATED: OP02-044 / 완다
-- rules_id=OP02-044 script_id=880000289 fingerprint=e8f5ff617d377cc89b13413662c35dd6f73b618eb7c7a4e4723652bbed111f05
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-044]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              name_neq=[[완다]],
              trait=[[밍크족]],
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
        source_text=[[【등장 시】자신의 패에서 「완다」 이외의 코스트 3 이하인 《밍크족》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-044]],
    schema_version=1,
  })
end
