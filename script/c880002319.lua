-- AUTO-GENERATED: OP15-017 / 모건
-- rules_id=OP15-017 script_id=880002319 fingerprint=d2567e3f62efbf1b259d23ccd1d67922ef942cf9c3967793819156af056f2af2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-017]],
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
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
            source=[[OWNER]],
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[GIVE_OPPONENT_DON]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[OPPONENT]],
            },
            state=[[RESTED]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】상대의 캐릭터 1장에 상대의 레스트 상태인 두웅!! 1장을 부여할 수 있다: 리더나 캐릭터 1장에 그 주인의 레스트 상태인 두웅!! 1장까지를 붙인다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP15-017]],
    schema_version=1,
  })
end
