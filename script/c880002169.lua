-- AUTO-GENERATED: OP14-004 / 캐번디시
-- rules_id=OP14-004 script_id=880002169 fingerprint=dcbccaa8d96449b70c771f845d476af0d1bce5212ae87b1de4617395f1175c71
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[RUSH]],
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
            amount=5000,
            op=[[SELF_POWER_GTE]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터의 파워가 5000 이상인 경우, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-004]],
    schema_version=1,
  })
end
