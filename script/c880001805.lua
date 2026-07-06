-- AUTO-GENERATED: ST06-006 / 타시기
-- rules_id=ST06-006 script_id=880001805 fingerprint=bb6e6e5b552e5e169eb20eab14c43c008cfc7ddd0c255e4c712aa8641c58b390
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST06-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -2.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST06-006]],
    schema_version=1,
  })
end
