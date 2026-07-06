-- AUTO-GENERATED: OP12-077 / '네 영향으로 생기는 소리는 전부 사라지는 수술'이다.
-- rules_id=OP12-077 script_id=880001530 fingerprint=38dd28453f54596c97f9e786f951206b96a8c113b59cfe4e5e01436e978b2776
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-077]],
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
              filter={
                name=[[트라팔가 로]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            attacker_selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
            duration=[[THIS_TURN]],
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】이번 턴 동안, 자신의 「트라팔가 로」를 1장까지 선택해 파워 +2000. 그 후, 이번 턴 동안, 선택한 카드가 어택할 경우 상대는 【블로커】를 발동할 수 없다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-077]],
    schema_version=1,
  })
end
