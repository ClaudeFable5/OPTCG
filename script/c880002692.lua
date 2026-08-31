-- MANUAL: ST34-001 / 샬롯 카타쿠리 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550034 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST34-001]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[빅 맘 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신 필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 자신의 리더가 특징 《빅 맘 해적단》을 가진 경우, 두웅!! 덱에서 두웅!!을 2장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_lte=8000,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 파워 8000 이하인 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[ST34-001]],
    schema_version=1,
  })
end
