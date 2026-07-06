-- AUTO-GENERATED: OP05-089 / 묘스가르드 성
-- rules_id=OP05-089 script_id=880000702 fingerprint=5e92a04397ab6a61b4ee45a77f3449ab79acdb6870716d2a5d513168244cebf3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-089]],
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
              cost_eq=1,
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
            count=1,
            filter={
              exclude_self=true,
            },
            kinds={
              [[CHARACTER]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다), 이 캐릭터와 자신의 캐릭터 1장을 레스트할 수 있다: 자신의 트래시에서 코스트 1인 흑색 캐릭터 카드를 1장까지 패에 더한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-089]],
    schema_version=1,
  })
end
