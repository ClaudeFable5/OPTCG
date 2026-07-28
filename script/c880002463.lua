-- AUTO-GENERATED: EB04-042 / 알파
-- rules_id=EB04-042 script_id=880002463 fingerprint=7a2b48e01b4877962ad188c4b44d39d3deebda0e3872727c36db467a6e8f2735
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-042]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1,
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
            count=3,
            op=[[MILL_DECK]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 트래시에 놓을 수 있다: 상대의 캐릭터 1장까지는 이번 턴 동안 코스트 -1.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-042]],
    schema_version=1,
  })
end
