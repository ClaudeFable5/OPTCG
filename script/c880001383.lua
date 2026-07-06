-- AUTO-GENERATED: OP11-049 / 캐럿
-- rules_id=OP11-049 script_id=880001383 fingerprint=7cfa36a5eeb6b595d83812428c92ffd0e2e79bd5fc216d5c9a1931cfec3d13a2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-049]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 어택 시】이 캐릭터를 트래시에 놓을 수 있다: 이번 배틀 동안, 자신의 리더 1장까지의 파워 +1000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-049]],
    schema_version=1,
  })
end
