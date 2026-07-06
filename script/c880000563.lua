-- AUTO-GENERATED: OP04-071 / Mr.4(베이브)
-- rules_id=OP04-071 script_id=880000563 fingerprint=8bf17c14cfd0e442d4055638b3063eacf1593801865503a44fad7d068672608f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-071]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            keyword=[[BLOCKER]],
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
            duration=[[THIS_BATTLE]],
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
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 어택 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 이번 배틀 동안, 이 캐릭터는 【블로커】를 얻고, 파워 +1000.
(상대의 어택 선언 후, 이 카드를 레스트로 하고 어택의 대상을 이 카드로 할 수 있다)]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-071]],
    schema_version=1,
  })
end
