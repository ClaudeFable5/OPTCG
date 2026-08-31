-- MANUAL: ST32-005 / 롤로노아 조로 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550032 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST32-005]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[TURN_PLAYED]],
            op=[[ALLOW_ATTACK_CHARACTER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
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
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            attribute=[[SLASH]],
            op=[[LEADER_HAS_ATTRIBUTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 속성(참)을 가진 경우, 상대의 코스트 2 이하인 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST32-005]],
    schema_version=1,
  })
end
