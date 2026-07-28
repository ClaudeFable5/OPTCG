-- AUTO-GENERATED: OP15-050 / 바비 펑크
-- rules_id=OP15-050 script_id=880002352 fingerprint=8d1cd400acf40b7f1df535a16fa0c7ebf3a38a88c0849d9aba048e84ccd76be0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-050]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
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
              name=[[켈리 펑크]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 「켈리 펑크」가 있는 경우, 이 캐릭터의 파워 +3000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-050]],
    schema_version=1,
  })
end
