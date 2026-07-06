-- AUTO-GENERATED: OP13-008 / 엠포리오 이반코프
-- rules_id=OP13-008 script_id=880001580 fingerprint=e9ddf50e1ee5ceba9c40cf60c326cd565a0478833d0aa497b80375cfd28748b9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                op=[[TRASH_SELF]],
              },
            },
            selector={
              count=0,
              filter={
                trait=[[혁명군]],
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
        source_text=[[자신의 《혁명군》 특징을 가진 캐릭터가 상대의 효과로 KO 당할 경우, 대신 이 캐릭터를 트래시에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-008]],
    schema_version=1,
  })
end
