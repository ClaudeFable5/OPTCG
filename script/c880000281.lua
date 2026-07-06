-- AUTO-GENERATED: OP02-037 / 니코 로빈
-- rules_id=OP02-037 script_id=880000281 fingerprint=ed1836b130c9ceab09da744298730b9d993d6e28e72ddd07a82a26e1611d2415
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-037]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=2,
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
        source_text=[[【등장 시】자신의 패에서 코스트 2 이하인 《FILM》 또는 《밀짚모자 일당》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-037]],
    schema_version=1,
  })
end
