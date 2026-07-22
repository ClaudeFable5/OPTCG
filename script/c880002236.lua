-- AUTO-GENERATED: OP14-071 / 피카
-- rules_id=OP14-071 script_id=880002236 fingerprint=37a96cce713144d01d956b5757302f5617d48430ca97355d421fbf4c43d5ba81
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-071]],
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
            trait=[[돈키호테 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 리더가 《돈키호테 해적단》 특징을 가진 경우, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-071]],
    schema_version=1,
  })
end
