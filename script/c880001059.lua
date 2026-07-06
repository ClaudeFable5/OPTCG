-- AUTO-GENERATED: OP08-083 / 시프스 헤드
-- rules_id=OP08-083 script_id=880001059 fingerprint=15aa4d1a8cfda50a798a6c2aa45c9b7c99c16f24d5e26dc832f703b91c3bc07b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_COST]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 동안】상대의 모든 캐릭터의 코스트 -1.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-083]],
    schema_version=1,
  })
end
