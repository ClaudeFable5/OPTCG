-- AUTO-GENERATED: P-090 / 샬롯 스무디
-- rules_id=P-090 script_id=880002065 fingerprint=fada5383bf6a0283f7e6e5785d1264b0bdd01bc0d2dc9e112e86ce7a08b6d272
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-090]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte_field_don_of=[[OPPONENT]],
              name_neq=[[샬롯 스무디]],
              trait=[[빅 맘 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】【KO 시】두웅!!-1: 자신의 패에서 「샬롯 스무디」 이외의 상대 필드의 두웅!! 수 이하의 코스트를 가지고, 《빅 맘 해적단》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[P-090]],
    schema_version=1,
  })
end
