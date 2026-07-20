-- AUTO-GENERATED: EB03-006 / 나미
-- rules_id=EB03-006 script_id=880002109 fingerprint=865e270240f6957becb55df196070c626fbb19e3b1b513087f16e544fd9b1dba
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            amount=-5000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_OWN_POWER]],
            selector={
              count=1,
              filter={
                state=[[ACTIVE]],
              },
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 액티브 상태인 리더의 파워를 -5000 할 수 있다: 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            amount=-1000,
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
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[알라바스타 왕국]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 리더가 《알라바스타 왕국》 특징을 가진 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-006]],
    schema_version=1,
  })
end
