-- AUTO-GENERATED: OP02-018 / 마르코
-- rules_id=OP02-018 script_id=880000262 fingerprint=55065a71110699aa33a98c634ba237129feedb4964712bdf1acd15abc7092cc2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-018]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=true,
            source=[[TRASH]],
          },
        },
        conditions={
          {
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            filter={
              trait_contains=[[흰 수염 해적단]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 『흰 수염 해적단』을 포함한 특징을 가진 카드 1장을 버릴 수 있다: 자신의 라이프가 2장 이하일 경우, 이 캐릭터 카드를 트래시에서 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP02-018]],
    schema_version=1,
  })
end
