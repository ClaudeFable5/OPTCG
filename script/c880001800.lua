-- AUTO-GENERATED: ST06-001 / 사카즈키
-- rules_id=ST06-001 script_id=880001800 fingerprint=13fee8a17a09a4daf27e8be6b1bee8efda31bd3aea72cc9748a7331151551aa2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST06-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_eq=0,
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
            count=3,
            op=[[REST_DON]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】3(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다), 자신의 패 1장을 버릴 수 있다: 상대의 코스트 0인 캐릭터를 1장까지 KO시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST06-001]],
    schema_version=1,
  })
end
