-- AUTO-GENERATED: OP05-053 / 모잠비아
-- rules_id=OP05-053 script_id=880000665 fingerprint=e5802e9fc2b11886820c4a850c611c0ea51092f1021c9eb6abcec49949ac0605
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-053]],
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
        source_text=[[【자신의 턴 동안】【턴 1회】자신이 드로우 페이즈 이외에 카드를 뽑았을 때, 이번 턴 동안, 이 캐릭터의 파워 +2000.]],
        timings={
          [[ON_DRAW_OUTSIDE_DRAW_PHASE]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-053]],
    schema_version=1,
  })
end
