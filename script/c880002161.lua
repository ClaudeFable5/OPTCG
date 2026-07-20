-- AUTO-GENERATED: EB03-058 / 릴리스
-- rules_id=EB03-058 script_id=880002161 fingerprint=a06fd79e0cf36c4e795444cd9533ebc06db497c5aff596f2b35b954370434dca
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-058]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
          {
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】자신의 라이프가 2장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[베가펑크]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 「베가펑크」인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-058]],
    schema_version=1,
  })
end
