-- AUTO-GENERATED: EB03-037 / 리무
-- rules_id=EB03-037 script_id=880002140 fingerprint=9790b5e283d81ee079ba010cedb056f57b1ecfacccb5a6914559a2ba228acb25
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-037]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              filter={
                trait=[[ODYSSEY]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=7,
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!이 7장 이상인 경우, 다음 상대의 엔드 페이즈 종료 시까지, 자신의 《ODYSSEY》 특징을 가진 리더와 모든 캐릭터의 파워 +1000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-037]],
    schema_version=1,
  })
end
