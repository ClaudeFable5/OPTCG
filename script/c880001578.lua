-- AUTO-GENERATED: OP13-006 / 우프 슬랩
-- rules_id=OP13-006 script_id=880001578 fingerprint=1a6c0adfc7bc5dfd7f6848aea0835a6b8fec3344a22b21aef90785d9e0c80a73
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                name=[[몽키 D. 루피]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 「몽키 D. 루피」 1장에게 레스트 상태인 두웅!!을 2장까지 부여한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-006]],
    schema_version=1,
  })
end
