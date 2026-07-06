-- AUTO-GENERATED: ST22-011 / 화이티 베이
-- rules_id=ST22-011 script_id=880001968 fingerprint=634af2971f3eeadc72a04c7019dfeb78014ea98432b014f3dfa8e024aa471c52
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST22-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait_contains=[[흰 수염 해적단]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={
          {
            count=2,
            filter={
              trait_contains=[[흰 수염 해적단]],
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】자신의 패에서 『흰 수염 해적단』을 포함한 특징을 가진 카드 2장을 공개할 수 있다: 이번 턴 동안, 자신의 『흰 수염 해적단』을 포함한 특징을 가진 리더 1장까지의 파워 +2000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST22-011]],
    schema_version=1,
  })
end
