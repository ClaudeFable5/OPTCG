-- AUTO-GENERATED: OP11-062 / 샬롯 카타쿠리
-- rules_id=OP11-062 script_id=880001396 fingerprint=c4ce883b01b402186c0782fe4bfa117d8c6c1a93601c693876cb498262691bc1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-062]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[LOOK_DECK_TOP]],
            player=[[OPPONENT]],
          },
          {
            amount=1000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【어택 시】/【상대의 어택 시】【턴 1회】두웅!!-1: 상대의 덱 위에서 1장을 본다. 그 후, 이번 배틀 동안, 이 리더의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-062]],
    schema_version=1,
  })
end
