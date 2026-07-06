-- AUTO-GENERATED: OP09-073 / 브룩
-- rules_id=OP09-073 script_id=880001169 fingerprint=3480b28ffb015ad641b60e2831b69a31dcd52523683c48449f2fe50700b82ede
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-073]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=2,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            min_count=1,
            mode=[[AT_LEAST]],
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신 필드의 두웅!!을 1장 이상 두웅!! 덱으로 되돌릴 수 있다: 이번 턴 동안, 상대의 캐릭터 2장까지의 파워 -2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-073]],
    schema_version=1,
  })
end
