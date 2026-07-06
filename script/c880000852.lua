-- AUTO-GENERATED: OP06-118 / 롤로노아 조로
-- rules_id=OP06-118 script_id=880000852 fingerprint=19a15aa64d1e9af2b35fe2e152faa32a948cf13827cb9746f4af927f8ce69fa4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-118]],
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
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【어택 시】【턴 1회】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 이 캐릭터를 액티브로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
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
        conditions={},
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】2(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 이 캐릭터를 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-118]],
    schema_version=1,
  })
end
