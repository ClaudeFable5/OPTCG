-- AUTO-GENERATED: OP05-092 / 로즈워드 성
-- rules_id=OP05-092 script_id=880000705 fingerprint=7067f8b90d4f6b41b9692b568860c531ab210100e3900fa3554965689476822b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-092]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-6,
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
        conditions={
          {
            filter={
              trait=[[천룡인]],
            },
            op=[[ONLY_CHARACTERS_MATCH]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】자신 필드의 캐릭터가 《천룡인》 특징을 가진 캐릭터뿐이라면, 상대의 모든 캐릭터의 코스트 -6.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-092]],
    schema_version=1,
  })
end
