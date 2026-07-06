-- AUTO-GENERATED: OP10-049 / 사보
-- rules_id=OP10-049 script_id=880001264 fingerprint=15718379049421b857c01d8b95eeac5c390208253e7cc547e434eb3a6db24669
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-049]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                op=[[RETURN_SELF_TO_HAND]],
              },
            },
            selector={
              count=0,
              filter={
                base_cost_lte=7,
                name_neq=[[사보]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[「사보」 이외의 자신의 원래 코스트가 7 이하인 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 이 캐릭터를 주인의 패로 되돌릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-049]],
    schema_version=1,
  })
end
