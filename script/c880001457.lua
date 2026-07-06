-- AUTO-GENERATED: OP12-004 / 코즈키 오뎅
-- rules_id=OP12-004 script_id=880001457 fingerprint=486148fb04f069a3d08d6080bdf7547a41d74328ae04039716a031f2ae3d111f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-004]],
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
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
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
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패에서 이벤트 2장을 공개할 수 있다: 이번 턴 동안, 이 캐릭터의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-004]],
    schema_version=1,
  })
end
