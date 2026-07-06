-- AUTO-GENERATED: OP08-001 / 토니토니 쵸파
-- rules_id=OP08-001 script_id=880000977 fingerprint=7a80eba5b1beb718b484183ab1a7cef890fecd9bb37fc2b2d85dc74cd10003e0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            per_target=true,
            player=[[YOU]],
            selector={
              count=3,
              filter={
                trait_any={
                  [[동물]],
                  [[드럼 왕국]],
                },
              },
              kind=[[CHARACTER]],
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
        source_text=[[【기동: 메인】【턴 1회】자신의 《동물》 또는 《드럼 왕국》 특징을 가진 캐릭터 3장까지에게 레스트 상태인 두웅!!을 1장씩까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-001]],
    schema_version=1,
  })
end
