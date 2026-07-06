-- AUTO-GENERATED: OP08-022 / 이누아라시
-- rules_id=OP08-022 script_id=880000998 fingerprint=adf94a3924e109a958a3dc0c63359cb4dd1b753232e5e4d061e4265c00960d0e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-022]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=2,
              filter={
                cost_lte=5,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밍크족]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《밍크족》 특징을 가진 경우, 상대의 레스트 상태이고 코스트 5 이하인 캐릭터 2장까지는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-022]],
    schema_version=1,
  })
end
