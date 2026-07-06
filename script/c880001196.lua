-- AUTO-GENERATED: OP09-100 / 카라스
-- rules_id=OP09-100 script_id=880001196 fingerprint=1482d46a184fc2aeffd3ccb4054f373a390dafb246c3d08e35d89aefb14481fe
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-100]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[혁명군]],
          },
          {
            count=5,
            op=[[LIFE_TOTAL_LTE]],
            players=[[BOTH]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《혁명군》 특징을 가지고, 서로의 라이프 합계가 5장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP09-100]],
    schema_version=1,
  })
end
