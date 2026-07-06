-- AUTO-GENERATED: OP06-117 / 방주 맥심
-- rules_id=OP06-117 script_id=880000851 fingerprint=9d4807aaa938e6e9f11c28c89abb2c7f19139e50e5aaad71ebecf613511e2f3d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-117]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=0,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            count=1,
            filter={
              name=[[에넬]],
            },
            kinds={
              [[LEADER]],
              [[CHARACTER]],
              [[STAGE]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이 카드와 자신의 「에넬」 1장을 레스트할 수 있다: 상대의 코스트 2 이하인 모든 캐릭터를 KO 시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-117]],
    schema_version=1,
  })
end
