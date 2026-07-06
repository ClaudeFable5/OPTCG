-- AUTO-GENERATED: OP10-077 / 베라미
-- rules_id=OP10-077 script_id=880001292 fingerprint=b8b415351c1b04476295243f399413c9985e370f5bc0ed3e4298543a1bdbdb0c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-077]],
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
        conditions={},
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【블록 시】자신의 두웅!! 2장을 레스트할 수 있다: 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP10-077]],
    schema_version=1,
  })
end
