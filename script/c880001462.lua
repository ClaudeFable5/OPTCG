-- AUTO-GENERATED: OP12-009 / 징베
-- rules_id=OP12-009 script_id=880001462 fingerprint=e57aed023394fc016d6afadfcb8b7bf353bd9d489d75c85903053b0a9a0176fc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=1000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=2,
            filter={
              card_type=[[EVENT]],
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 이벤트 2장을 공개할 수 있다: 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다. 그 후, 다음 상대의 엔드 페이즈 종료 시까지, 이 캐릭터의 파워 +1000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-009]],
    schema_version=1,
  })
end
