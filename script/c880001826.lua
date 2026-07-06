-- AUTO-GENERATED: ST07-010 / 샬롯 링링
-- rules_id=ST07-010 script_id=880001826 fingerprint=b027a28695d149d88d594a2666d15fa67831d06b718a713532018b151564c5e4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST07-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[OPPONENT_CHOOSES]],
            options={
              {
                {
                  count=1,
                  mode=[[EXACT]],
                  op=[[TRASH_LIFE_TOP]],
                  player=[[OPPONENT]],
                },
              },
              {
                {
                  count=1,
                  mode=[[EXACT]],
                  op=[[ADD_LIFE_FROM_DECK_TOP]],
                  player=[[YOU]],
                },
              },
            },
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대는 아래에서 하나를 선택한다.
・상대의 라이프 위에서 1장을 트래시로 보낸다.
・자신의 덱 위에서 1장을 라이프 맨 위에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST07-010]],
    schema_version=1,
  })
end
