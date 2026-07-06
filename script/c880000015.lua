-- AUTO-GENERATED: EB01-016 / 빈고
-- rules_id=EB01-016 script_id=880000015 fingerprint=775a841e626ca4bf81738f7dc62e24114c51859b0f7c416afa5a7d6bc10f9fa1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=1,
                state=[[RESTED]],
              },
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
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 상대의 레스트 상태이고 코스트 1 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-016]],
    schema_version=1,
  })
end
