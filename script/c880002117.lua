-- AUTO-GENERATED: EB03-014 / 쿠이나
-- rules_id=EB03-014 script_id=880002117 fingerprint=59e0a1845e75285781c559785fcb8038d07451c95de99eae71fa255e6672aaf9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                attribute=[[SLASH]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
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
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 자신의 <참격> 속성을 가진 리더에게 레스트 상태인 두웅!!을 2장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-014]],
    schema_version=1,
  })
end
