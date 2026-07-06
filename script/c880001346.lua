-- AUTO-GENERATED: OP11-012 / 프랑키
-- rules_id=OP11-012 script_id=880001346 fingerprint=2031feaa22143fee91490d691c26eb608ca89839f924b9b795f0ff400530bc78
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
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
        source_text=[[【자신의 턴 동안】【턴 1회】상대가 이벤트를 발동했을 때, 이번 턴 동안, 자신의 모든 캐릭터의 파워 +2000.]],
        timings={
          [[ON_OPPONENT_EVENT_ACTIVATED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-012]],
    schema_version=1,
  })
end
