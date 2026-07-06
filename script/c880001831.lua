-- AUTO-GENERATED: ST07-015 / 소울 포커스
-- rules_id=ST07-015 script_id=880001831 fingerprint=f5f55ebd3ec58c5c5fcf2807bddb55d1c73e7710b8700a451b1d6b127b798c01
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST07-015]],
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
        source_text=[[【메인】상대는 아래에서 하나를 선택한다.
・상대의 라이프 위에서 1장을 트래시로 보낸다.
・자신의 덱 위에서 1장을 라이프 맨 위에 더한다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST07-015]],
    schema_version=1,
  })
end
