-- AUTO-GENERATED: EB01-027 / Mr.1(다즈 보네스)
-- rules_id=EB01-027 script_id=880000026 fingerprint=0407e55ef1b7e8f8ceffcb0f7dc2d21454001781c4d5c6bdfbc61e0c4093fe64
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            divisor=2,
            duration=[[WHILE_CONDITION]],
            filter={
              card_type=[[EVENT]],
            },
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
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[바로크 워크스]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 『바로크 워크스』를 포함한 특징을 가진 경우, 자신의 트래시에 있는 이벤트 2장당, 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-027]],
    schema_version=1,
  })
end
