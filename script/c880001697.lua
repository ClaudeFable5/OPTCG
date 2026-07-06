-- AUTO-GENERATED: PRB02-005 / 몽키 D. 루피
-- rules_id=PRB02-005 script_id=880001697 fingerprint=273d96d96c67a67bc69e2b5c6502673a5033a59a7539c59e6d43e85217296d03
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB02-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=1,
                mode=[[EXACT]],
                op=[[REST_DON]],
                player=[[OPPONENT]],
                schedule=[[OPPONENT_NEXT_MAIN_PHASE_START]],
              },
            },
            conditions={
              {
                op=[[LEADER_IS_MULTICOLOR]],
                player=[[YOU]],
              },
              {
                count=7,
                op=[[FIELD_DON_LTE]],
                player=[[OPPONENT]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】자신의 리더가 다색이고, 상대 필드의 두웅!!이 7장 이하인 경우, 다음 상대의 메인 페이즈 개시 시, 상대는 자신의 액티브 상태인 두웅!! 1장을 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[PRB02-005]],
    schema_version=1,
  })
end
