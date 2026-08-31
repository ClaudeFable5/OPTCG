-- MANUAL: OP17-027 / 벤 베크만 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-027]],
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
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            op=[[REST]],
            selector={
              count=2,
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
            trait=[[빨간 머리 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 특징 《빨간 머리 해적단》을 가진 경우, 카드를 1장 뽑고, 상대의 캐릭터 2장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP17-027]],
    schema_version=1,
  })
end
