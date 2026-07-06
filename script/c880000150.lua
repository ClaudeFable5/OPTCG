-- AUTO-GENERATED: OP01-027 / 라운드 테이블
-- rules_id=OP01-027 script_id=880000150 fingerprint=9f295d4fd539d90171ead1b6146bbdb0934996d7c24fd331d03dd3c3df5cd660
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-10000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 이번 턴 동안, 상대 캐릭터 1장까지의 파워 -10000.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-027]],
    schema_version=1,
  })
end
