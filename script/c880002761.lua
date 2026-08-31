-- MANUAL: OP17-055 / 영원히 계속되는 권력 따윈 이 세상에 없어!!! (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-055]],
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
                name=[[록스 D. 지벡]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 두웅!! 1장을 레스트로 할 수 있다：자신의 「록스 D. 지벡」 1장까지는 이번 턴 동안 【블록 불가】를 얻는다.]],
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
    rules_id=[[OP17-055]],
    schema_version=1,
  })
end
