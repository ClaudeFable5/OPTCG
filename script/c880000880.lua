-- AUTO-GENERATED: OP07-026 / 쥬얼리 보니
-- rules_id=OP07-026 script_id=880000880 fingerprint=343d03d1f0412cb3b8d7600c2c73346aacb8d6b8b0619cce1e72082fdf4f36f8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=1,
              filter={
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            count=1,
            don_state=[[RESTED]],
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            mode=[[UP_TO]],
            op=[[CANNOT_SET_ACTIVE_CARD_OR_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 레스트 상태인 캐릭터 또는 두웅!! 1장까지는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-026]],
    schema_version=1,
  })
end
