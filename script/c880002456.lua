-- AUTO-GENERATED: EB04-035 / 살인귀 카마조
-- rules_id=EB04-035 script_id=880002456 fingerprint=74df52618b37190fa3ee69e27a87a2ecf359c80c01bff10a69dec888004e2c12
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-035]],
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
            op=[[YOUR_TURN]],
          },
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[키드 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신의 필드의 두웅!!이 두웅!! 덱에 되돌아갔을 때, 자신의 리더가 《키드 해적단》 특징을 가진 경우, 두웅!! 덱에서 두웅!! 1장까지를 레스트로 추가한다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB04-035]],
    schema_version=1,
  })
end
