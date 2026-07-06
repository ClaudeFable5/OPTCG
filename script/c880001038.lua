-- AUTO-GENERATED: OP08-062 / 샬롯 카타쿠리
-- rules_id=OP08-062 script_id=880001038 fingerprint=1d665c51ced5123545f636dcf8466e8786b0c65f5b933ae3bb10b6faeb622c96
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-062]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_gte=3,
              cost_lte_field_don_of=[[OPPONENT]],
              name=[[샬롯 카타쿠리]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
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
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 《빅 맘 해적단》 특징을 가진 경우, 자신의 패에서 코스트 3 이상이고, 상대 필드의 두웅!! 수 이하의 코스트를 가진 「샬롯 카타쿠리」를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-062]],
    schema_version=1,
  })
end
