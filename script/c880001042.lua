-- AUTO-GENERATED: OP08-066 / 샬롯 브륄레
-- rules_id=OP08-066 script_id=880001042 fingerprint=66f0fa23dbb5dbc0b09b5f386c703594f9cbfc38e4940b17031a9cb75bdb171f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-066]],
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
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP08-066]],
    schema_version=1,
  })
end
