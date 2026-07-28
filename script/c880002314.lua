-- AUTO-GENERATED: OP15-012 / 버기
-- rules_id=OP15-012 script_id=880002314 fingerprint=5ba207b92e8d59bba7dd65e294329f5ee5ba77b946367e1a83cb99fb71564525
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
            source=[[OWNER]],
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】리더나 캐릭터 1장에 그 주인의 레스트 상태인 두웅!! 1장까지를 붙인다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-012]],
    schema_version=1,
  })
end
