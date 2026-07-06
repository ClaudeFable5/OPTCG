-- AUTO-GENERATED: OP09-075 / 유스타스 키드
-- rules_id=OP09-075 script_id=880001171 fingerprint=9c949e17982aadf0dcbd6fd0447d5449399beae5612f7dabe39d64cedb5fd3e2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-075]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[키드 해적단]],
          },
        },
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위에서 1장을 패에 더할 수 있다: 자신의 리더가 《키드 해적단》 특징을 가진 경우, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-075]],
    schema_version=1,
  })
end
