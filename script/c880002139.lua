-- AUTO-GENERATED: EB03-036 / 베이비 5
-- rules_id=EB03-036 script_id=880002139 fingerprint=f14d96361542dd47d1adf16c5e972127188cc727030792e839b6ad1430bf6754
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=2,
              filter={
                base_cost_lte=3,
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
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두둥!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 상대의 원래 코스트가 3 이하인 캐릭터를 2장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-036]],
    schema_version=1,
  })
end
