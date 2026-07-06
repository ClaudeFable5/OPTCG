-- AUTO-GENERATED: OP05-084 / 차를로스 성
-- rules_id=OP05-084 script_id=880000697 fingerprint=56eae82eb3150bcecfef948e9161015b91af74c1c49f688f94e13f761fbd9e15
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-084]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-4,
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
        source_text=[[【자신의 턴 동안】자신 필드의 캐릭터가 《천룡인》 특징을 가진 캐릭터뿐이라면, 상대의 모든 캐릭터의 코스트 -4.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-084]],
    schema_version=1,
  })
end
