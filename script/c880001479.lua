-- AUTO-GENERATED: OP12-026 / 쿠이나
-- rules_id=OP12-026 script_id=880001479 fingerprint=a35f6a2f71d4fe2ab1a787acb357317e5a1b7d3efa7bc93249750ad956216df2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                base_cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=3,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                name=[[롤로노아 조로]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
            ["then"]=true,
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
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 상대의 원래 코스트가 4 이하인 캐릭터를 1장까지 레스트로 한다. 그 후, 자신의 리더인 「롤로노아 조로」에게 레스트 상태인 두웅!!을 3장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-026]],
    schema_version=1,
  })
end
