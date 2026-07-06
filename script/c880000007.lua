-- AUTO-GENERATED: EB01-008 / 리틀 오즈 Jr.
-- rules_id=EB01-008 script_id=880000007 fingerprint=edf7eb5af2353fbd173778c9044dd7d30c06a7eb5a241a91d2c7eb5f6702c27f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[EFFECT]],
            replacement_costs={
              {
                count=1,
                filter={
                  any={
                    {
                      card_type=[[EVENT]],
                    },
                    {
                      card_type=[[STAGE]],
                    },
                  },
                },
                op=[[TRASH_HAND]],
              },
            },
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】이 캐릭터가 효과에 의해 KO 당할 경우, 대신 자신의 패에서 이벤트 또는 스테이지 카드 1장을 버릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-008]],
    schema_version=1,
  })
end
