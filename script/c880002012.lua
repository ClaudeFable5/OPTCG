-- AUTO-GENERATED: P-008 / 야마토
-- rules_id=P-008 script_id=880002012 fingerprint=702c452a802bb563e1d69af637cd16c90d5c3803850900f3ce3678bdda77c609
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 상대의 코스트 2 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-008]],
    schema_version=1,
  })
end
