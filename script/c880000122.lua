-- AUTO-GENERATED: EB02-060 / 고잉 메리 호
-- rules_id=EB02-060 script_id=880000122 fingerprint=5cd8a3e83075e64ed326e9883a9df784f4b8b12fd6213f62de02b0adc8b1d2fd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[밀짚모자 일당]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            count=1,
            faceup=true,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 스테이지를 레스트하고, 자신의 라이프 위에서 1장을 앞면으로 할 수 있다: 다음 상대의 턴 종료 시까지, 자신의 《밀짚모자 일당》 특징을 가진 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-060]],
    schema_version=1,
  })
end
