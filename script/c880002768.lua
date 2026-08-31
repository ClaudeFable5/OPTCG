-- MANUAL: OP17-062 / 카이도 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-062]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
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
        source_text=[[【자신의 턴 동안】【턴 1회】자신 필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다. 그 후, 자신의 두웅!! 1장까지를 액티브로 한다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP17-062]],
    schema_version=1,
  })
end
