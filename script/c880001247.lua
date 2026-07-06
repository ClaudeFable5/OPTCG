-- AUTO-GENERATED: OP10-032 / 타시기
-- rules_id=OP10-032 script_id=880001247 fingerprint=2c5646d0c469aeb4c78d4007d52230dfbae22b9b3c64b3a05881c9a313dce5d4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-032]],
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
                op=[[REST_SELF]],
              },
            },
            selector={
              count=0,
              filter={
                color=[[GREEN]],
                name_neq=[[타시기]],
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
        source_text=[[「타시기」 이외의 자신의 녹색 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 이 캐릭터를 레스트할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-032]],
    schema_version=1,
  })
end
