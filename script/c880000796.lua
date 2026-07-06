-- AUTO-GENERATED: OP06-062 / 빈스모크 저지
-- rules_id=OP06-062 script_id=880000796 fingerprint=38053b3e725ab28b375b2cf76a31c3ced117c7dbebd46bbb19352fddcfdceb03
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-062]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=4,
            filter={
              card_type=[[CHARACTER]],
              power_lte=4000,
              trait=[[제르마 66]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_DISTINCT_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
          {
            count=2,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다), 자신의 패 2장을 버릴 수 있다: 자신의 트래시에서 카드명이 다른 파워 4000 이하인 《제르마 66》 특징을 가진 캐릭터 카드를 4장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[REST_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-1: 상대의 두웅!!을 1장까지 레스트로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-062]],
    schema_version=1,
  })
end
