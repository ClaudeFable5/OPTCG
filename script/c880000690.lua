-- AUTO-GENERATED: OP05-077 / 감마 나이프
-- rules_id=OP05-077 script_id=880000690 fingerprint=03fb063374f542560036a06eef0ad7b3c21668907f71d9eff6cf2001c81fe355
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-077]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-5000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
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
        source_text=[[【메인】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -5000.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-077]],
    schema_version=1,
  })
end
