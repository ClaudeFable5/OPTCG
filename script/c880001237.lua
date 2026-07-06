-- AUTO-GENERATED: OP10-022 / 트라팔가 로
-- rules_id=OP10-022 script_id=880001237 fingerprint=f896c16568aae01a5e591b5549ba3c8888e1d4b517e633721d26995855281eb1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-022]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              trait=[[초신성]],
            },
            op=[[PLAY_FROM_LIFE_TOP]],
            player=[[YOU]],
            rested=false,
            reveal=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_OWN_CARD_TO_HAND]],
            selector={
              count=1,
              filter={},
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【기동: 메인】【턴 1회】자신의 캐릭터의 코스트 합계가 5 이상인 경우, 자신의 캐릭터 1장을 주인의 패로 되돌릴 수 있다: 자신의 라이프 위에서 1장을 공개하고 그 카드가 코스트 5 이하인 《초신성》 특징을 가진 캐릭터 카드인 경우, 등장시킬 수 있다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-022]],
    schema_version=1,
  })
end
