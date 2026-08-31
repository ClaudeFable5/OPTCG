-- MANUAL: OP17-069 / 잭 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-069]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_ATTACK_LEADER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E0]],
        once_per_turn=false,
        source_text=[[【속공：캐릭터】(이 카드는 등장한 턴에 캐릭터에게 어택할 수 있다)]],
        timings={
          [[ON_PLAY]],
        },
      },

      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[백수 해적단]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1：자신의 리더가 특징 《백수 해적단》을 가진 경우, 상대의 캐릭터 1장까지를 이번 턴 동안 파워 -2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP17-069]],
    schema_version=1,
  })
end
