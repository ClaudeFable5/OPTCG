-- AUTO-GENERATED: OP02-025 / 킨에몬
-- rules_id=OP02-025 script_id=880000269 fingerprint=52258da2c1927875fa5c01061df59019574c2ab80c205176e7f5f4ed5b33b25f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1,
            duration=[[THIS_TURN]],
            filter={
              card_type=[[CHARACTER]],
              cost_gte=3,
              trait=[[와노쿠니]],
            },
            op=[[MODIFY_NEXT_PLAY_COST]],
            player=[[YOU]],
            uses=1,
            zone=[[HAND]],
          },
        },
        conditions={
          {
            count=1,
            op=[[CHARACTER_COUNT_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 캐릭터가 1장 이하인 경우, 이번 턴 동안, 다음에 자신이 패에서 등장시키는 코스트 3 이상인 《와노쿠니》 특징을 가진 캐릭터 카드의 지불 코스트는 1 적어진다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-025]],
    schema_version=1,
  })
end
