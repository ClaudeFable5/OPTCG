-- AUTO-GENERATED: OP02-087 / 미노타우로스
-- rules_id=OP02-087 script_id=880000332 fingerprint=d88a6c44ed7fe1124d5a3c6563d5554578ac3b88f3f84604725e3235cbb7a038
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-087]],
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
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[임펠 다운]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 《임펠 다운》 특징을 가진 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[DOUBLE_ATTACK]],
    },
    rules_id=[[OP02-087]],
    schema_version=1,
  })
end
