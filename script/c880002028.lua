-- AUTO-GENERATED: P-024 / '해적왕'이 난 될테다!!!
-- rules_id=P-024 script_id=880002028 fingerprint=6fcdf8bf6d95fb91c7345edaa2d6a4465ef38e5c40e4d8cab4cb5b123a50279a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            divisor=1,
            duration=[[THIS_TURN]],
            filter={
              card_type=[[CHARACTER]],
            },
            op=[[MODIFY_POWER_PER_COUNT]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source=[[CHARACTER]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 이번 턴 동안, 자신의 리더는 자신의 캐릭터 1장당 파워 +1000.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
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
        source_text=[[이번 턴 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[P-024]],
    schema_version=1,
  })
end
