-- AUTO-GENERATED: OP13-066 / 실버즈 레일리
-- rules_id=OP13-066 script_id=880001638 fingerprint=ff0173e0502b4d0aa62349691df923cda386601097a5de13cc541ff78e2b5832
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-066]],
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
            op=[[ADD_DON]],
            player=[[YOU]],
            schedule=[[THIS_TURN_END]],
            state=[[ACTIVE]],
            ["then"]=true,
          },
        },
        conditions={
          {
            count=1,
            op=[[ATTACHED_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 부여되어 있는 두웅!!이 있을 경우, 상대의 코스트 5 이하인 캐릭터를 1장까지 레스트로 한다. 그 후, 이번 턴 종료 시, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP13-066]],
    schema_version=1,
  })
end
