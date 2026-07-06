-- AUTO-GENERATED: OP13-039 / 고무고무 뱀총
-- rules_id=OP13-039 script_id=880001611 fingerprint=486f936b93a7af62ebffe68160dc3036c4918607b08793eff72fcd5ca62ca7d6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-039]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=4,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】상대의 레스트 상태이고 코스트 4 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            effect_timing=[[COUNTER]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【카운터】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-039]],
    schema_version=1,
  })
end
