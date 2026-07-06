-- AUTO-GENERATED: OP12-037 / 귀기 구검류 아수라 발검 망자의 장난
-- rules_id=OP12-037 script_id=880001490 fingerprint=aa096591c111c4edcd683e56b9e72b26265ad9274581537aa8ec702bedd4a8b1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-037]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=2,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            count=2,
            mode=[[UP_TO]],
            op=[[REST_CARD_OR_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 두웅!! 3장을 레스트할 수 있다: 상대의 캐릭터 또는 두웅!!을 합계 2장까지 레스트로 한다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더의 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-037]],
    schema_version=1,
  })
end
