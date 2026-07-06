-- AUTO-GENERATED: OP11-102 / 케이미
-- rules_id=OP11-102 script_id=880001436 fingerprint=64647331fd164cec4478ad96c512912625dd8e494bc5fe55f5ecbd788f400d19
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-102]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[TRASH_LIFE_TOP]],
            player=[[YOU]],
          },
          {
            count=1,
            mode=[[EXACT]],
            op=[[TRASH_LIFE_TOP]],
            player=[[OPPONENT]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
          {
            count=2,
            op=[[LIFE_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】상대가 이벤트 또는 【트리거】를 발동했을 때, 발동할 수 있다. 상대의 라이프가 2장 이상인 경우, 서로의 라이프 위에서 1장을 트래시로 보낸다.]],
        timings={
          [[ON_OPPONENT_EVENT_OR_TRIGGER_ACTIVATED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-102]],
    schema_version=1,
  })
end
