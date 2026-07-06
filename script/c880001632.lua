-- AUTO-GENERATED: OP13-060 / 아마츠키 토키
-- rules_id=OP13-060 script_id=880001632 fingerprint=7ef126c2e2ae078a45e7d05a27ec641d5273a9f1003ac0315e42f128e7503fd0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-060]],
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
                trait_contains=[[로저 해적단]],
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
        source_text=[[자신의 『로저 해적단』을 포함한 특징을 가진 캐릭터가 상대의 효과로 KO 당할 경우, 대신 이 캐릭터를 트래시에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-060]],
    schema_version=1,
  })
end
