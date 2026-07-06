-- AUTO-GENERATED: OP04-088 / 하이루딘
-- rules_id=OP04-088 script_id=880000580 fingerprint=4b325a3dec0d1b44b5be4fbb561265bc9deefec3c85b156e3dea3a2a2483e636
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-088]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-4,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={},
            kinds={
              [[LEADER]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 리더 1장을 레스트할 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -4.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-088]],
    schema_version=1,
  })
end
