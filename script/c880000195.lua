-- AUTO-GENERATED: OP01-072 / 스마일리
-- rules_id=OP01-072 script_id=880000195 fingerprint=18cd6b9676147eda58f5dc6989e3564f1efea094cc79ed70d695e38fa0a94b93
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-072]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            divisor=1,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER_PER_COUNT]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source=[[HAND]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 동안】자신의 패 1장당, 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-072]],
    schema_version=1,
  })
end
