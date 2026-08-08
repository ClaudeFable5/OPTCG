-- MANUAL: OP16-066 / 센고쿠 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-066]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            player=[[YOU]],
            state=[[RESTED]],
          },
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
            ["then"]=true,
          },
          {
            count=2,
            mode=[[EXACT]],
            op=[[TRASH_HAND]],
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
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】 자신의 리더가 특징 《해군》을 가질 경우, 두웅!! 덱에서 두웅!! 2장까지를 레스트 상태로 추가한다. 그 후, 카드 2장을 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-066]],
    schema_version=1,
  })
end
