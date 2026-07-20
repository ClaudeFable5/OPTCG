-- AUTO-GENERATED: EB03-033 / 샬롯 브륄레
-- rules_id=EB03-033 script_id=880002136 fingerprint=e0d48fc95e5a39dd7dc877618234eaf4b113a068e02d4a2c8f4ac8cfd41c8bca
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-033]],
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
            op=[[EVENT_CAUSED_BY_OWN_EFFECT]],
          },
          {
            op=[[OPPONENT_TURN]],
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
        source_text=[[【상대의 턴 동안】【턴 1회】자신 필드의 두웅!!이 자신의 효과에 의해 두웅!! 덱으로 되돌려졌을 때, 자신의 리더가 《빅 맘 해적단》 특징을 가진 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-033]],
    schema_version=1,
  })
end
