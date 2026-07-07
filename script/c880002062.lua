-- AUTO-GENERATED: P-079 / 리무
-- rules_id=P-079 script_id=880002062 fingerprint=75b282269415d037fead42c93292a24984a7b2e6b502497385aca20d059dff88
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-079]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=2,
            filter={
              trait=[[ODYSSEY]],
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 레스트 상태인 《ODYSSEY》 특징을 가진 캐릭터가 2장 이상 있는 경우, 이 캐릭터를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[P-079]],
    schema_version=1,
  })
end
