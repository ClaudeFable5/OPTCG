-- AUTO-GENERATED: EB01-048 / 라분
-- rules_id=EB01-048 script_id=880000047 fingerprint=ac479694dfbf96b8fd095c60108593197ab26438525b7c4c8f1a67d98369b9c6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-4,
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
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -4.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-048]],
    schema_version=1,
  })
end
