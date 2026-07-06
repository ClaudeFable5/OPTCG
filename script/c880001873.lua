-- AUTO-GENERATED: ST10-013 / 유스타스 키드
-- rules_id=ST10-013 script_id=880001873 fingerprint=3cca35b27bb789651dfda9c0ea1dc129bd28e71817ea6a1a9d435b2df625d8aa
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST10-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
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
        source_text=[[【등장 시】/【어택 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 다음 자신의 턴 개시 시까지, 자신의 리더 1장까지의 파워 +1000.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST10-013]],
    schema_version=1,
  })
end
