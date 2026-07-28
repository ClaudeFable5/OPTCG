-- AUTO-GENERATED: EB04-018 / 메가로
-- rules_id=EB04-018 script_id=880002439 fingerprint=76dd51e29cd2cff43bc0a1fd35b150504bbdb6e7de6e6f23644746f1086e9742
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-018]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                power_lte=8000,
                state=[[RESTED]],
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
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이 캐릭터를 레스트로 할 수 있다: 상대의 레스트 상태인 파워 8000 이하의 캐릭터 1장까지를 KO한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-018]],
    schema_version=1,
  })
end
