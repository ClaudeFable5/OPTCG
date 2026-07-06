-- AUTO-GENERATED: OP09-086 / 지저스 바제스
-- rules_id=OP09-086 script_id=880001182 fingerprint=56c4fef0ee59775f2e0cfa084be830dc6e8ebc5d183e8a432331708b25bb18b4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-086]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[OPPONENT_EFFECT]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터는 상대의 효과로는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            amount_per=1000,
            divisor=4,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER_PER_COUNT]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source=[[TRASH]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[검은 수염 해적단]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《검은 수염 해적단》 특징을 가진 경우, 자신의 트래시 4장당, 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-086]],
    schema_version=1,
  })
end
