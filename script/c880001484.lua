-- AUTO-GENERATED: OP12-031 / 타시기
-- rules_id=OP12-031 script_id=880001484 fingerprint=5f851d81ad0a7d1d225cd925f8c76bc3f7fe6636433dd04c86201ab8fae1eace
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                base_cost_lte=6,
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
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 원래 코스트가 6 이하인 캐릭터를 1장까지 레스트로 한다. 그 후, 자신의 리더인 「롤로노아 조로」에게 레스트 상태인 두웅!!을 3장까지 부여한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-031]],
    schema_version=1,
  })
end
