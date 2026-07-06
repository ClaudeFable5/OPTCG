-- AUTO-GENERATED: OP09-111 / 브룩
-- rules_id=OP09-111 script_id=880001207 fingerprint=87d49adb86fb8f0f3c19d9c16261383eb4e8e173433011057c1b37d86d579e81
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-111]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[에그 헤드]],
          },
          {
            count=6,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《에그 헤드》 특징을 가지고, 상대의 패가 6장 이상인 경우, 상대는 자신의 패 2장을 버린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-111]],
    schema_version=1,
  })
end
