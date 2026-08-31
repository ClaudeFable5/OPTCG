-- MANUAL: OP17-040 / 에드워드 뉴게이트 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-040]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
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
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[록스 해적단]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신의 『록스 해적단』을 포함한 특징을 가진 리더가 어택했을 때나 어택당했을 때, 자신의 패 1장을 버리고 발동할 수 있다. 자신의 리더를 이번 배틀 동안 파워 +3000.]],
        timings={
          [[ON_OWN_LEADER_BATTLE]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-040]],
    schema_version=1,
  })
end
