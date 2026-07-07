-- AUTO-GENERATED: P-062 / 호디 & 효조
-- rules_id=P-062 script_id=880002056 fingerprint=9a717f2352f05bb1cedf10d2093ee1a55fa35e6a2a9a4f80687715653909dab4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-062]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】상대의 코스트 4 이하인 캐릭터를 1장까지 레스트로 하고, 이번 턴 동안, 이 캐릭터의 파워 +1000. 그 후, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-062]],
    schema_version=1,
  })
end
