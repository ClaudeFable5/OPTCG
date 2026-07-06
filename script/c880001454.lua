-- AUTO-GENERATED: OP12-001 / 실버즈 레일리
-- rules_id=OP12-001 script_id=880001454 fingerprint=f08e2ee3d4760627ffb426b3fbf701497ad926d1a419832d080bd5c3468dde38
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[RULE]],
            forbidden_filter={
              cost_gte=5,
            },
            op=[[DECK_BUILD_RESTRICTION]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[룰상, 자신은 코스트 5 이상인 카드를 덱에 넣을 수 없다.]],
        timings={
          [[RULE]],
        },
      },
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                base_power_lte=4000,
              },
              kind=[[CHARACTER]],
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
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패에서 이벤트 2장을 공개할 수 있다: 이번 턴 동안, 자신의 원래 파워가 4000 이하인 캐릭터 1장까지의 파워 +2000]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-001]],
    schema_version=1,
  })
end
