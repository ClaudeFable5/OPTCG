-- AUTO-GENERATED: OP12-003 / 크로커스
-- rules_id=OP12-003 script_id=880001456 fingerprint=96968c5fbd4795799fe51cd5b26b42c8b435e9f3b433dd874ed800529743e110
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[RED]],
              power_lte=3000,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=2,
            filter={
              card_type=[[EVENT]],
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 이벤트 2장을 공개할 수 있다: 자신의 패에서 파워 3000 이하인 적색 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-003]],
    schema_version=1,
  })
end
