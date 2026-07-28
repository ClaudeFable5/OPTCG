-- AUTO-GENERATED: EB04-014 / 코즈키 스키야키
-- rules_id=EB04-014 script_id=880002435 fingerprint=07f1cf3a4318fa9d084ebbff825112ee5fb1dc1c22b80280faf90c2035f68625
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                trait=[[와노쿠니]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 《와노쿠니》 특징을 가진 리더에 레스트 상태인 두웅!! 1장까지를 붙인다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB04-014]],
    schema_version=1,
  })
end
