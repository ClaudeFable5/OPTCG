-- AUTO-GENERATED: OP14-054 / 피셔 타이거
-- rules_id=OP14-054 script_id=880002219 fingerprint=31b044af20facc942967c6be05e24438e09e7d30cbbd51300e087184511195bb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-054]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[어인족]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《어인족》 특징을 가진 경우, 카드를 3장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=5,
            op=[[TRASH_HAND_TO_COUNT]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 패가 5장이 되도록 패를 버린다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-054]],
    schema_version=1,
  })
end
