-- AUTO-GENERATED: OP04-031 / 돈키호테 도플라밍고
-- rules_id=OP04-031 script_id=880000522 fingerprint=c0b176e60ba6517917985f06e9dc094f35f3b3a3fe5b62b019bccb311e0bf4d8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=3,
              filter={
                state=[[RESTED]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 레스트 상태인 리더와 캐릭터 합계 3장까지는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-031]],
    schema_version=1,
  })
end
