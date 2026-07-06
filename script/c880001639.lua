-- AUTO-GENERATED: OP13-067 / 스코퍼 가반
-- rules_id=OP13-067 script_id=880001639 fingerprint=aef0125230237b7233b9d4170d990f5cc850b58b1f311779f9f2a0af634d15d6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-067]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[로저 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 『로저 해적단』을 포함한 특징을 가진 경우, 카드를 2장 뽑고, 자신의 패 1장을 버린다. 그 후, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-067]],
    schema_version=1,
  })
end
