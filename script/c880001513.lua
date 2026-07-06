-- AUTO-GENERATED: OP12-060 / 뵈프 버스트
-- rules_id=OP12-060 script_id=880001513 fingerprint=afd2d0d15ef5b878a137965dd648fdc45c2e479c4468395cb51e145001bcd50d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            option_conditions={
              {},
              {
                {
                  count=6,
                  op=[[HAND_LTE]],
                  player=[[YOU]],
                },
              },
            },
            options={
              {
                {
                  op=[[RETURN_TO_HAND]],
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
              },
              {
                {
                  count=2,
                  op=[[DRAW]],
                  player=[[YOU]],
                },
              },
            },
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_IS_MULTICOLOR]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 리더가 다색인 경우, 아래에서 하나를 선택한다.
・상대의 코스트 4 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.
・자신의 패가 6장 이하인 경우, 카드를 2장 뽑는다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-060]],
    schema_version=1,
  })
end
