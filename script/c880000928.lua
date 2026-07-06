-- AUTO-GENERATED: OP07-073 / 몽키 D. 루피
-- rules_id=OP07-073 script_id=880000928 fingerprint=7a8fd3006b44592219b6162bde6d14a0308277c3eef8210dab59ff7ff2a39984
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-073]],
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
        conditions={
          {
            count=3,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={
          {
            count=3,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-3(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 상대의 캐릭터가 3장 이상인 경우, 이 캐릭터를 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-073]],
    schema_version=1,
  })
end
