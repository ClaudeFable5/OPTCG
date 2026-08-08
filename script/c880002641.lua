-- MANUAL: OP16-084 / 코즈키 모모노스케 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-084]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=9,
              name=[[코즈키 모모노스케]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=9,
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            filter={
              cost_gte=20,
            },
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동 메인】 코스트 20 이상인 이 캐릭터를 트래시에 놓을 수 있다：자신의 필드의 두웅!!이 9장 이상 있을 경우, 자신의 트래시에서 코스트 9인 「코즈키 모모노스케」 1장까지를 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-084]],
    schema_version=1,
  })
end
