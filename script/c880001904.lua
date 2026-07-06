-- AUTO-GENERATED: ST13-005 / 엠포리오 이반코프
-- rules_id=ST13-005 script_id=880001904 fingerprint=c44b02102a471530a8be4808e0cf32992e579fc36ebb58cf0d255c853bff7691
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            faceup=false,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=5,
            },
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_HAND]],
            player=[[YOU]],
            reveal=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_LIFE_TOP]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위나 아래에서 1장을 트래시에 놓을 수 있다: 자신의 패에서 코스트 5인 캐릭터 카드 1장를 공개하고 라이프 맨 위에 뒷면으로 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST13-005]],
    schema_version=1,
  })
end
