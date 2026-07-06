-- AUTO-GENERATED: OP09-076 / 롤로노아 조로
-- rules_id=OP09-076 script_id=880001172 fingerprint=87036d1a6e682280c8049a9cef29289181c846df20f0f0cc6b17dbf328f3feb0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-076]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={},
        costs={
          {
            min_count=1,
            mode=[[AT_LEAST]],
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!을 1장 이상 두웅!! 덱으로 되돌릴 수 있다: 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-076]],
    schema_version=1,
  })
end
