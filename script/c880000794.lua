-- AUTO-GENERATED: OP06-060 / 빈스모크 이치디
-- rules_id=OP06-060 script_id=880000794 fingerprint=a21b28b02c9000b0339c21848c3ec93d1574cd967ecc17a9c180ffa2d2f2a9b1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_eq=7,
              name=[[빈스모크 이치디]],
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
            trait=[[제르마 66]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다), 이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 《제르마 66》 특징을 가진 경우, 자신의 패 또는 트래시에서 코스트 7인 「빈스모크 이치디」를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-060]],
    schema_version=1,
  })
end
