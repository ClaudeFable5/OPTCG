-- AUTO-GENERATED: ST02-001 / 유스타스 키드
-- rules_id=ST02-001 script_id=880001729 fingerprint=c62e2595e1a3aabb5777012f0aee99e32ea32edbf3c5d3602e322dc0d39a871b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST02-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[REST_DON]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】3(코스트 에리의 두웅!!을 지정된 수만큼 레스트 할 수 있다), 자신의 패를 1장 버릴 수 있다: 이 리더를 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST02-001]],
    schema_version=1,
  })
end
