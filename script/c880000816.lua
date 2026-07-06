-- AUTO-GENERATED: OP06-082 / 개펭귄
-- rules_id=OP06-082 script_id=880000816 fingerprint=b92d61862859e97eaa21c4c58dcfc2d24532da6bb3d9890045b4c0c618ced64b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-082]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[스릴러 바크 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【KO 시】자신의 리더가 《스릴러 바크 해적단》 특징을 가진 경우, 카드를 2장 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[ON_PLAY]],
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-082]],
    schema_version=1,
  })
end
