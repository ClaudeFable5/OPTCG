-- AUTO-GENERATED: ST29-007 / 토니토니 쵸파
-- rules_id=ST29-007 script_id=880002292 fingerprint=e239eb25ed611f6047d6f4bfdc125e60aa5b2aca086e0d035511c61a4ea5d04c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_HAND]],
            player=[[YOU]],
            position=[[LIFE_TOP]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 라이프 위나 아래에서 1장을 패에 넣을 수 있다: 자신의 패 1장까지를 라이프 위에 놓는다.]],
        timings={
          [[ON_KO]],
        },
      },
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name=[[몽키 D. 루피]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】자신의 「몽키 D. 루피」 1장까지는 이번 턴 동안 파워 +2000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST29-007]],
    schema_version=1,
  })
end
