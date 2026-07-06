-- AUTO-GENERATED: PRB02-010 / 샬롯 푸딩
-- rules_id=PRB02-010 script_id=880001701 fingerprint=915e573d8dce8bac32cdef7cab38b6ad3d8c4bfd4a3dee4475c236efeef13b38
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB02-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=2,
                op=[[DRAW]],
                player=[[YOU]],
              },
              {
                count=1,
                filter={
                  card_type=[[CHARACTER]],
                  power_gte=6000,
                  power_lte=8000,
                  trait=[[빅 맘 해적단]],
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
                count=6,
                op=[[FIELD_DON_GTE]],
                player=[[OPPONENT]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[빅 맘 해적단]],
          },
        },
        costs={
          {
            count=2,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-2: 자신의 리더가 《빅 맘 해적단》 특징을 가지고, 상대 필드의 두웅!!이 6장 이상인 경우, 카드를 2장 뽑는다. 그 후, 자신의 패에서 파워 6000에서 8000인 《빅 맘 해적단》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[PRB02-010]],
    schema_version=1,
  })
end
