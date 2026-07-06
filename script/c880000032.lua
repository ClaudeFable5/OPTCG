-- AUTO-GENERATED: EB01-033 / 블루노
-- rules_id=EB01-033 script_id=880000032 fingerprint=f23e05b61ad2ffaafb9aa91c879d4d27f22373bb3232616fbd1ec00acd9c8a7f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=5,
              name_neq=[[블루노]],
              trait=[[워터 세븐]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND_OR_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[워터 세븐]],
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
        source_text=[[【등장 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 리더가 《워터 세븐》 특징을 가진 경우, 자신의 패 또는 트래시에서 「블루노」 이외의 코스트 5인 《워터 세븐》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-033]],
    schema_version=1,
  })
end
