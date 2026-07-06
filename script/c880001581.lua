-- AUTO-GENERATED: OP13-009 / 컬리 다단
-- rules_id=OP13-009 script_id=880001581 fingerprint=d3145264092ea4770c24685c7cbc0dee2a3c3d02691ee7b07ff65de399fab553
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[DOUBLE_ATTACK]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              exclude_self=true,
              trait=[[산적]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 카드 이외의 《산적》 특징을 가진 캐릭터가 있을 경우, 이 캐릭터는 【더블 어택】을 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-009]],
    schema_version=1,
  })
end
