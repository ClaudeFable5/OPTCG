-- AUTO-GENERATED PROMO: P-159 / 몽키 D. 루피
-- rules_id=P-159 script_id=880002537
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-159]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_lte=6000,
              trait=[[밀짚모자 일당]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            count=1,
            op=[[ATTACHED_DON_GTE]],
            selector={
              kind=[[LEADER]],
              owner=[[YOU]],
            },
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더에게 부여된 두웅!!이 있을 경우, 자신의 패에서 파워 6000 이하인 《밀짚모자 일당》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[P-159]],
    schema_version=1,
  })
end
