-- AUTO-GENERATED: OP02-041 / 몽키 D. 루피
-- rules_id=OP02-041 script_id=880000286 fingerprint=defb67023363a52c969eba0912bacdcf77c1b4dac09bacb2ed6d2fa7f0a50e56
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-041]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
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
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 코스트 4 이하인 《FILM》 또는 《밀짚모자 일당》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP02-041]],
    schema_version=1,
  })
end
