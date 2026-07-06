-- AUTO-GENERATED: OP05-074 / 유스타스 키드
-- rules_id=OP05-074 script_id=880000687 fingerprint=97329d4b5b9f9523fc71dcc117961423d4d5910fc6690b263a3d893456b7a415
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-074]],
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
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신 필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP05-074]],
    schema_version=1,
  })
end
