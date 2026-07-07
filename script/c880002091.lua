-- AUTO-GENERATED: ST19-002 / 센고쿠
-- rules_id=ST19-002 script_id=880002091 fingerprint=ef620ab6d055a975087580e34117644bf6e0ea9f559a367d7f6c5ac0af327a3d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST19-002]],
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
            trait=[[해군]],
          },
        },
        costs={
          {
            count=2,
            filter={
              color=[[BLACK]],
              trait=[[해군]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 흑색인 《해군》 특징을 가진 카드 2장을 버릴 수 있다: 자신의 리더가 《해군》 특징을 가진 경우, 카드를 3장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST19-002]],
    schema_version=1,
  })
end
