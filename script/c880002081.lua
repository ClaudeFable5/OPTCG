-- AUTO-GENERATED: ST16-003 / 샬롯 카타쿠리
-- rules_id=ST16-003 script_id=880002081 fingerprint=05023693b8262caae0e3d1cfec1be8d7bed2eaa5e41f0aadd8be84b323b943c5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST16-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
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
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[FILM]],
          },
          {
            count=6,
            op=[[RESTED_CARD_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《FILM》 특징을 가지고, 자신의 레스트 상태인 카드가 6장 이상인 경우, 이 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[ST16-003]],
    schema_version=1,
  })
end
