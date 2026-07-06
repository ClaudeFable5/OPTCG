-- AUTO-GENERATED: OP05-107 / 스페이시 중위
-- rules_id=OP05-107 script_id=880000720 fingerprint=278fb0864f285e945ee6b7a183f63a66e2eaab9d5f2b74a7cb0b9586b05c014e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-107]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신의 라이프가 패에 추가되었을 때, 이번 턴 동안, 이 캐릭터의 파워 +2000.]],
        timings={
          [[ON_LIFE_ADDED_TO_HAND]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-107]],
    schema_version=1,
  })
end
