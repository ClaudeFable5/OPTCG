-- AUTO-GENERATED: OP09-105 / 상디
-- rules_id=OP09-105 script_id=880001201 fingerprint=3c53fa2af2affad07806f0bb74e8c37f5a9ca75b76aa03065686c79b5436ac6b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-105]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[에그 헤드]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《에그 헤드》 특징을 가진 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다. 그 후, 자신의 패 2장을 버린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-105]],
    schema_version=1,
  })
end
