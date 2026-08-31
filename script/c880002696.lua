-- MANUAL: ST34-005 / 타마고 남작 & 페콤즈 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550034 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST34-005]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=2000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】두웅!!-1：상대의 원래 파워 2000 이하인 캐릭터 1장까지를 KO한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST34-005]],
    schema_version=1,
  })
end
