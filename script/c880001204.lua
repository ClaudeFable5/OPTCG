-- AUTO-GENERATED: OP09-108 / 바솔로뮤 쿠마
-- rules_id=OP09-108 script_id=880001204 fingerprint=c01c0321f38e83e93c035afc30b76f76cd635c201c3db52d850d89d20b9f7701
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-108]],
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
    keywords={},
    rules_id=[[OP09-108]],
    schema_version=1,
  })
end
