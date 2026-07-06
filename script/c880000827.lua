-- AUTO-GENERATED: OP06-093 / 페로나
-- rules_id=OP06-093 script_id=880000827 fingerprint=bc515e160d2ff5ac95ad791a160c1865e27685960fee488ad636d9e7feb1cc8f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-093]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            options={
              {
                {
                  count=1,
                  op=[[TRASH_HAND]],
                  player=[[OPPONENT]],
                },
              },
              {
                {
                  amount=-3,
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
            },
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=5,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 패가 5장 이상인 경우, 아래에서 하나를 선택한다.
・상대는 자신의 패 1장을 버린다.
・이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -3.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-093]],
    schema_version=1,
  })
end
