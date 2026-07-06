-- AUTO-GENERATED: OP04-080 / 개츠
-- rules_id=OP04-080 script_id=880000572 fingerprint=ae8a39fd6cdb821fd1d6e0673d2cfd31165b7231fbbbf4d612c1a84fa9cae15c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-080]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[ALLOW_ATTACK_ACTIVE_CHARACTER]],
            selector={
              count=1,
              filter={
                trait=[[드레스로자]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 《드레스로자》 특징을 가진 캐릭터 1장까지는 액티브 상태인 캐릭터도 어택할 수 있다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-080]],
    schema_version=1,
  })
end
