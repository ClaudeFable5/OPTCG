-- MANUAL: OP16-058 / 수인들의 폭동이다~~~!!! (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-058]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[SET_BASE_POWER]],
            selector={
              filter={
                name=[[임펠다운 수인]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
            value=7000,
          },
        },
        conditions={
          {
            count=10,
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 필드의 두웅!!이 10장 있을 경우, 자신의 「임펠다운 수인」 전부를 이번 턴 동안 원래 파워 7000으로 한다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=4000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name=[[버기]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】 자신의 「버기」 1장까지를 이번 배틀 동안 파워 +4000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-058]],
    schema_version=1,
  })
end
