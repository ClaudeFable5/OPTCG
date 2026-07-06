-- AUTO-GENERATED: OP02-120 / 우타
-- rules_id=OP02-120 script_id=880000365 fingerprint=29d44c972b9c4ef8fbc925f8f506f6b8d02a937591be2209231102cceb08b453
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-120]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-2(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 다음 자신의 턴 개시 시까지, 자신의 리더와 모든 캐릭터의 파워 +1000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-120]],
    schema_version=1,
  })
end
