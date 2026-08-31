-- MANUAL: OP17-115 / 인의라는 게 있다고 멍텅구리야!!! (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-115]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[UNBLOCKABLE]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                name=[[샬롯 링링]],
              },
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 리더 「샬롯 링링」은 이번 턴 동안 【블록 불가】를 얻는다.]],
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
                name=[[샬롯 링링]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 「샬롯 링링」 1장까지를 이번 배틀 동안 파워 +4000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-115]],
    schema_version=1,
  })
end
