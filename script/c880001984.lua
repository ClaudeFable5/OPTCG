-- AUTO-GENERATED: ST24-005 / X 드레이크
-- rules_id=ST24-005 script_id=880001984 fingerprint=937d169b60496df92aa05799ba3e7ac59a73f626ca5eabffea13e969dc866f88
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST24-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
            schedule=[[THIS_TURN_END]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[초신성]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《초신성》 특징을 가진 경우, 상대의 코스트 5 이하인 캐릭터를 1장까지 레스트로 한다. 그 후, 이번 턴 종료 시, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST24-005]],
    schema_version=1,
  })
end
