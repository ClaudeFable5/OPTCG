-- AUTO-GENERATED: OP14-009 / 트라팔가 로
-- rules_id=OP14-009 script_id=880002174 fingerprint=ce8bc628f36440115eced001c9c455ca80acdf7e657db354f0b608e81906df45
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            op=[[SWAP_BASE_POWER]],
            second_selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【속공】(이 카드는 등장한 턴에 어택할 수 있다)
【상대의 어택 시】【턴 1회】자신의 패 2장을 버릴 수 있다: 자신의 리더와 캐릭터 1장을 고른다. 고른 카드 각각의 원래 파워를, 이번 배틀 동안, 맞바꾼다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP14-009]],
    schema_version=1,
  })
end
