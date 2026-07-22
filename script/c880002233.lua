-- AUTO-GENERATED: OP14-068 / 트레볼
-- rules_id=OP14-068 script_id=880002233 fingerprint=7047b1b3f194eac11c6375020da670a4bacebac2f47b46619ac0ef6811742bd3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-068]],
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
            op=[[OPPONENT_TURN]],
          },
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[돈키호테 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 턴 동안】【턴 1회】자신 필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 자신의 리더가 《돈키호테 해적단》 특징을 가진 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-068]],
    schema_version=1,
  })
end
