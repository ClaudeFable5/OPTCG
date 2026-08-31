-- MANUAL: OP17-056 / 록스해적단 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-056]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=5,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 두웅!! 5장을 레스트로 할 수 있다：코스트 6 이하인 캐릭터 1장까지를 주인의 패로 되돌린다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait_contains=[[록스 해적단]],
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
        source_text=[[【카운터】자신의 『록스 해적단』을 포함한 특징을 가진 리더나 캐릭터 1장까지를 이번 배틀 동안 파워 +2000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-056]],
    schema_version=1,
  })
end
