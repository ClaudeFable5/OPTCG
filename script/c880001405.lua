-- AUTO-GENERATED: OP11-071 / 샬롯 페로스페로
-- rules_id=OP11-071 script_id=880001405 fingerprint=414db44aaed3417f8864d8442ee5d90c870b50202e21e9028f647f40ac6852be
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-071]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            on_match={
              {
                count=1,
                op=[[DRAW]],
                player=[[YOU]],
              },
              {
                count=1,
                mode=[[UP_TO]],
                op=[[ADD_DON]],
                player=[[YOU]],
                state=[[ACTIVE]],
              },
            },
            op=[[DECLARE_COST_REVEAL]],
            player=[[YOU]],
            reveal_player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패 1장을 버릴 수 있다: 의의 코스트를 선언하고, 상대의 덱 위에서 1장을 공개한다. 공개한 카드가 선언한 코스트와 같은 경우, 카드를 1장 뽑고, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-071]],
    schema_version=1,
  })
end
