-- AUTO-GENERATED: OP09-012 / 몬스터
-- rules_id=OP09-012 script_id=880001107 fingerprint=08572e5621af2dcf52858233b37cfb6daca23ed68701c7d1f366753c71b83a15
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[EFFECT]],
            replacement_costs={
              {
                op=[[TRASH_SELF]],
              },
            },
            selector={
              count=0,
              filter={
                name=[[봉크 펀치]],
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
        source_text=[[자신의 캐릭터인 「봉크 펀치」가 효과로 KO 당할 경우, 대신 이 캐릭터를 트래시에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-012]],
    schema_version=1,
  })
end
