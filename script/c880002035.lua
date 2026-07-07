-- AUTO-GENERATED: P-035 / 몽키 D. 루피
-- rules_id=P-035 script_id=880002035 fingerprint=0d5210fe76cb52ed7c090a7e6a20917366c6e29f2f5befcb9683d81c07fa422f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-035]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_eq=0,
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
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 패를 1장 버릴 수 있다: 상대의 코스트 0인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-035]],
    schema_version=1,
  })
end
