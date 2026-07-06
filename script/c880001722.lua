-- AUTO-GENERATED: ST01-011 / 브룩
-- rules_id=ST01-011 script_id=880001722 fingerprint=afd23e070701e1545a229b17283aab05e4b724e095693042730a2d44560ee480
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST01-011]],
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
        source_text=[[【등장 시】자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 2장까지 부여한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST01-011]],
    schema_version=1,
  })
end
