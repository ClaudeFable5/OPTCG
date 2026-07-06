-- AUTO-GENERATED: OP02-089 / 지옥의 심판
-- rules_id=OP02-089 script_id=880000334 fingerprint=e8e96f9ef3d73efedb0f464703e75343cb9d645ad454ec2ec513702c8f895848
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-089]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=2,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 이번 턴 동안, 상대의 리더 또는 캐릭터 합계 2장까지의 파워 -3000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[RETURN_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=6,
            op=[[FIELD_DON_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대 필드의 두웅!!이 6장 이상인 경우, 상대는 자신 필드의 두웅!! 1장을 두웅!! 덱으로 되돌린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-089]],
    schema_version=1,
  })
end
