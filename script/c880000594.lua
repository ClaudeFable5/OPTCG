-- AUTO-GENERATED: OP04-102 / 킨에몬
-- rules_id=OP04-102 script_id=880000594 fingerprint=3c11992e6735a1a2f9023bfe8c5519ff158aed834e1a2715c0707f75bcc3f326
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-102]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다), 자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 이 캐릭터를 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-102]],
    schema_version=1,
  })
end
