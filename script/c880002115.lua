-- AUTO-GENERATED: EB03-012 / 오타마
-- rules_id=EB03-012 script_id=880002115 fingerprint=f582fba239844071489e822321b07071f263e25f99e3d84868536487355999b4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=1,
              filter={
                cost_lte=3,
                trait_any={
                  [[동물]],
                  [[SMILE]],
                },
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            count=1,
            mode=[[UP_TO]],
            op=[[REST_CARD_OR_DON]],
            player=[[OPPONENT]],
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
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 상대의 코스트 3 이하인 《동물》 또는 《SMILE》 특징을 가진 캐릭터 또는 두웅!!을 1장까지 레스트로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-012]],
    schema_version=1,
  })
end
