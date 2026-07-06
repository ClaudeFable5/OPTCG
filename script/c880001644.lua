-- AUTO-GENERATED: OP13-072 / 버기
-- rules_id=OP13-072 script_id=880001644 fingerprint=9c2c3dff6e464ec95b7b89eabcded792ba0f20c60b3f3a78a0b626434a540901
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-072]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[로저 해적단]],
          },
          {
            count=1,
            op=[[ATTACHED_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 『로저 해적단』을 포함한 특징을 가지고, 자신의 부여되어 있는 두웅!!이 있을 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-072]],
    schema_version=1,
  })
end
