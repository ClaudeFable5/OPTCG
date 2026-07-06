-- AUTO-GENERATED: OP04-025 / 조라
-- rules_id=OP04-025 script_id=880000516 fingerprint=dde4be6856eb8dc995072183089881a8a22e2e6425636a4968787f8f644fd1ac
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=4,
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
            count=2,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 어택 시】2(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 상대의 코스트 4 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-025]],
    schema_version=1,
  })
end
