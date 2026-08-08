-- MANUAL: OP16-060 / 센고쿠 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-060]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=3,
            distinct_names=true,
            filter={
              card_type=[[CHARACTER]],
              trait=[[대장]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=8,
            op=[[RETURN_DON]],
            state=[[ACTIVE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동 메인】 자신의 액티브 상태인 두웅!! 8장을 두웅!! 덱으로 되돌릴 수 있다：자신의 패에서 카드명이 다른 특징 《대장》을 가진 캐릭터 카드 3장까지를 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-060]],
    schema_version=1,
  })
end
