-- AUTO-GENERATED: EB02-039 / 제르마 66
-- rules_id=EB02-039 script_id=880000101 fingerprint=c464feb5803e40d3b2990b53a3a16c7303faa7f95c1384bd7ad0fbd713275e5f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-039]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              name_eq_last_target=true,
              power_gte=5000,
              power_lte=7000,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_lte=4000,
              trait=[[제르마 66]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 패에서 파워 4000 이하인 《제르마 66》 특징을 가진 캐릭터 카드를 1장까지 버릴 수 있다: 자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하인 경우, 자신의 트래시에서 파워 5000에서 7000인 버린 카드와 같은 카드명을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-039]],
    schema_version=1,
  })
end
