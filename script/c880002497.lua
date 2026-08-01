-- AUTO-GENERATED PROMO: P-067 / 유스타스 키드
-- rules_id=P-067 script_id=880002497
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-067]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            attacker_player=[[OPPONENT]],
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_ATTACK_TARGETS]],
            target_filter={
              any={
                {
                  card_type=[[LEADER]],
                },
                {
                  card_type=[[CHARACTER]],
                  name_neq=[[유스타스 키드]],
                },
              },
            },
          },
        },
        conditions={
          {
            op=[[SELF_STATE_IS]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터가 레스트 상태인 경우, 상대는 캐릭터인 「유스타스 키드」 이외는 어택할 수 없다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-067]],
    schema_version=1,
  })
end
