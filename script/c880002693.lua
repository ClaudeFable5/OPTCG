-- MANUAL: ST34-002 / 샬롯 크래커 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550034 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST34-002]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[빅 맘 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 특징 《빅 맘 해적단》을 가진 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다. 그 후, 상대의 코스트 2 이하인 캐릭터 1장까지를 KO한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST34-002]],
    schema_version=1,
  })
end
