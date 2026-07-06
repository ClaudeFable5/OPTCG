-- AUTO-GENERATED: OP01-055 / 내 '사무라이'가 돼라!!!
-- rules_id=OP01-055 script_id=880000178 fingerprint=3b8052e02e1bb8310c2a04118f561ba54445f614ec830be9e9f7c40f17fff1bf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            filter={},
            kinds={
              [[CHARACTER]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 캐릭터 2장을 레스트할 수 있다: 카드를 2장 뽑는다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-055]],
    schema_version=1,
  })
end
