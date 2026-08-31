-- MANUAL: ST31-003 / 브룩 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550031 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST31-003]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=3,
            op=[[ATTACHED_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 부여되어 있는 두웅!!이 합계 3장 이상인 경우, 이 캐릭터는 【블로커】를 얻고, 파워 +3000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST31-003]],
    schema_version=1,
  })
end
