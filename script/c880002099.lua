-- AUTO-GENERATED: ST20-005 / 샬롯 링링
-- rules_id=ST20-005 script_id=880002099 fingerprint=ceaae755b197ff95ed96dc01dc047b2f680c216e705ad01d4ea693777e6588b0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST20-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[OPPONENT_CHOOSES]],
            option_conditions={
              {
                {
                  count=2,
                  op=[[HAND_GTE]],
                  player=[[OPPONENT]],
                },
              },
              {
                {
                  count=1,
                  op=[[LIFE_GTE]],
                  player=[[OPPONENT]],
                },
              },
            },
            options={
              {
                {
                  count=2,
                  op=[[TRASH_HAND]],
                  player=[[OPPONENT]],
                },
              },
              {
                {
                  count=1,
                  mode=[[EXACT]],
                  op=[[TRASH_LIFE_TOP]],
                  player=[[OPPONENT]],
                },
              },
            },
            player=[[OPPONENT]],
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
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 상대는 아래에서 하나를 선택한다.
・상대는 자신의 패 2장을 버린다.
・상대의 라이프 위에서 1장을 트래시로 보낸다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST20-005]],
    schema_version=1,
  })
end
