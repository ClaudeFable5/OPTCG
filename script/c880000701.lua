-- AUTO-GENERATED: OP05-088 / 맨셸리
-- rules_id=OP05-088 script_id=880000701 fingerprint=3bf09ee2f41cf1af94c3404daa74e380bd85ba7f4c5e4b8fa250df2d73e20747
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-088]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              color=[[BLACK]],
              cost_gte=3,
              cost_lte=5,
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
          {
            op=[[REST_SELF]],
          },
          {
            count=2,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다), 이 캐릭터를 레스트하고, 자신의 트래시에서 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 자신의 트래시에서 코스트 3에서 5인 흑색 캐릭터 카드를 1장까지 패에 더한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-088]],
    schema_version=1,
  })
end
