-- AUTO-GENERATED: OP06-042 / 빈스모크 레이주
-- rules_id=OP06-042 script_id=880000776 fingerprint=1499c4272bc187d7afbc6aaa3d982f059f307aea289a469823d55b2ee6ef0b44
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-042]],
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
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신 필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 카드를 1장 뽑는다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-042]],
    schema_version=1,
  })
end
