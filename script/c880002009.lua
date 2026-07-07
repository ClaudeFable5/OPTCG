-- AUTO-GENERATED: P-005 / 카이도
-- rules_id=P-005 script_id=880002009 fingerprint=31e13677c8e8368ba192f10326f7ef7b561ba4d2213f4c1565f2c860b71b56ee
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[BANISH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】두웅!!-2(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 이번 턴 동안, 이 캐릭터는 【배니시】를 얻는다.
(이 카드가 대미지를 주었을 경우, 트리거는 발동하지 않으며 그 카드는 트래시로 보내진다)]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-005]],
    schema_version=1,
  })
end
