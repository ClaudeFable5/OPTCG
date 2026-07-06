-- AUTO-GENERATED: OP13-075 / 한 판 붙어볼까. 살아있기에 할 수 있는 '살육전'을!!!
-- rules_id=OP13-075 script_id=880001647 fingerprint=2228b383af525675ad84ebf1931c3fd003a35672f9fc35076bd05ba4cce1cf67
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-075]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            name=[[골 D. 로저]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[ATTACHED_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 두웅!! 1장을 레스트할 수 있다: 자신의 리더가 「골 D. 로저」이고, 자신의 부여되어 있는 두웅!!이 있을 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
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
    rules_id=[[OP13-075]],
    schema_version=1,
  })
end
