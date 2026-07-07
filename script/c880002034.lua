-- AUTO-GENERATED: P-032 / 센고쿠
-- rules_id=P-032 script_id=880002034 fingerprint=5e7e53e85bc88e57a2856c14830e9c359e4f4b23b946667c11f19b541af5d304
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2,
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
        source_text=[[【두웅!!×1】 【자신의 턴 동안】 상대의 모든 캐릭터의 코스트 -2.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-032]],
    schema_version=1,
  })
end
