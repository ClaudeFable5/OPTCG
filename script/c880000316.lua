-- AUTO-GENERATED: OP02-071 / 마젤란
-- rules_id=OP02-071 script_id=880000316 fingerprint=52b4952dbc350dd7426eba38724f036648718d7ab7943e1e59a770bdb353520e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-071]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
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
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 이번 턴 동안, 이 리더의 파워 +1000.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-071]],
    schema_version=1,
  })
end
