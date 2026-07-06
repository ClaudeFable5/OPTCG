-- AUTO-GENERATED: OP06-108 / 텐구야마 히테츠
-- rules_id=OP06-108 script_id=880000842 fingerprint=b2e78630452fd610ee60723b15d78298ab695412390807db8e8d9aba64522240
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-108]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[와노쿠니]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이번 턴 동안, 자신의 《와노쿠니》 특징을 가진 리더 또는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-108]],
    schema_version=1,
  })
end
