-- AUTO-GENERATED: ST16-001 / 우타
-- rules_id=ST16-001 script_id=880002079 fingerprint=0bc7bddc11210e044b024e4a73ab0dafb41fab750766fe2082a9c32b0573e623
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST16-001]],
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
            filter={
              trait=[[FILM]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패에서 《FILM》 특징을 가진 카드 1장을 버릴 수 있다: 자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST16-001]],
    schema_version=1,
  })
end
