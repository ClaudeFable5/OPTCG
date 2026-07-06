-- AUTO-GENERATED: ST08-005 / 샹크스
-- rules_id=ST08-005 script_id=880001838 fingerprint=985cf8a100b67d85e1bfaee14b847b60e16fa78f739cc738e172e75910620ed4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST08-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=0,
              filter={
                cost_lte=1,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[ANY]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 코스트 1 이하인 모든 캐릭터를 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST08-005]],
    schema_version=1,
  })
end
