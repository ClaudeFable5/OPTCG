-- AUTO-GENERATED: OP07-104 / 니코 로빈
-- rules_id=OP07-104 script_id=880000959 fingerprint=ba524a7492a775b66e5d0295efbee2b77b491a07df5c05c004fe97000b6e8c93
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-104]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
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
        source_text=[[자신의 리더가 《에그 헤드》 특징을 가진 경우, 카드를 2장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-104]],
    schema_version=1,
  })
end
