-- AUTO-GENERATED: OP12-074 / 파티
-- rules_id=OP12-074 script_id=880001527 fingerprint=aca3716e71df35c777dabe134440b0f3eedbe6ed4ba9a6562cc00906da403a7c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-074]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={
          {
            name=[[상디]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            filter={
              card_type=[[EVENT]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 이벤트 1장을 버릴 수 있다: 자신의 리더가 「상디」인 경우, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-074]],
    schema_version=1,
  })
end
