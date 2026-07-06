-- AUTO-GENERATED: OP06-068 / 빈스모크 레이주
-- rules_id=OP06-068 script_id=880000802 fingerprint=3e83ed41cad53b9cbf53625e47eec98af5acd04a8294b246723ad3d5e4c0d30a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-068]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_eq=4,
              name=[[빈스모크 레이주]],
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
        source_text=[[【기동: 메인】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다), 이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 《제르마 66》 특징을 가진 경우, 자신의 패 또는 트래시에서 코스트 4인 「빈스모크 레이주」를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-068]],
    schema_version=1,
  })
end
