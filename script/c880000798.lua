-- AUTO-GENERATED: OP06-064 / 빈스모크 니디
-- rules_id=OP06-064 script_id=880000798 fingerprint=e86ad361f89bb06470f6e4686b1d4ebf27f84669c1f5e727dfb354d8e70e932e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-064]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_eq=5,
              name=[[빈스모크 니디]],
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
        source_text=[[【기동: 메인】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다), 이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 《제르마 66》 특징을 가진 경우, 자신의 패 또는 트래시에서 코스트 5인 「빈스모크 니디」를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-064]],
    schema_version=1,
  })
end
