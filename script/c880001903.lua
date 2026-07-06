-- AUTO-GENERATED: ST13-004 / 에드워드 뉴게이트
-- rules_id=ST13-004 script_id=880001903 fingerprint=f1ce66c40afae13e2d6855fb9f2cfa8cd029a4ebce15eea7d719c6f231cbf71a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
          {
            count=1,
            destination=[[DECK_TOP]],
            op=[[REORDER_ALL_LIFE_RETURN_ONE_TO_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 1장을 라이프 맨 위에 더한다. 그 후, 자신의 모든 라이프를 보고 1장을 자신의 덱 맨 위로 되돌리고, 라이프를 원하는 순서대로 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST13-004]],
    schema_version=1,
  })
end
