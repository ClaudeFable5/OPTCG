-- AUTO-GENERATED: ST20-001 / 샬롯 카타쿠리
-- rules_id=ST20-001 script_id=880002095 fingerprint=41324623a7ed07258f3ce6bcaf21f90cbe7d9ed33a4f46617e4b61bb9aca8b75
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST20-001]],
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
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            faceup=true,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 라이프 위에서 1장을 앞면으로 할 수 있다: 자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST20-001]],
    schema_version=1,
  })
end
