-- AUTO-GENERATED: OP01-093 / 울티
-- rules_id=OP01-093 script_id=880000216 fingerprint=657b750f2d47c630e5031f44818d266e5bdb2f1f396f461710f3d3bc65fbd697
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-093]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다) : 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-093]],
    schema_version=1,
  })
end
