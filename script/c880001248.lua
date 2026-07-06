-- AUTO-GENERATED: OP10-033 / 나미
-- rules_id=OP10-033 script_id=880001248 fingerprint=c636d5527d530015f8773ca36dcd812bcc4945e9e7265ad66c4a55c773c84aa0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=1,
                duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
                filter={
                  state=[[RESTED]],
                },
                op=[[CANNOT_SET_DON_ACTIVE]],
                player=[[OPPONENT]],
              },
            },
            conditions={
              {
                count=2,
                filter={
                  state=[[RESTED]],
                  trait=[[ODYSSEY]],
                },
                op=[[CHARACTER_COUNT_GTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 레스트 상태인 《ODYSSEY》 특징을 가진 캐릭터가 2장 이상인 경우, 상대의 레스트 상태인 두웅!!을 1장까지는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-033]],
    schema_version=1,
  })
end
