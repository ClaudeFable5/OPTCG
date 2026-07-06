-- AUTO-GENERATED: OP13-095 / 로즈워드 성
-- rules_id=OP13-095 script_id=880001667 fingerprint=a9b29f4756a3e829ab188f8443c7039407c6d6bb47ff097167c485cb4b94e71a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-095]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                op=[[KO]],
                selector={
                  count=2,
                  filter={
                    base_cost_lte=3,
                  },
                  kind=[[CHARACTER]],
                  mode=[[UP_TO]],
                  owner=[[OPPONENT]],
                },
              },
            },
            conditions={
              {
                filter={
                  trait=[[천룡인]],
                },
                op=[[ONLY_CHARACTERS_MATCH]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 자신의 캐릭터가 《천룡인》 특징을 가진 캐릭터뿐이라면, 상대의 원래 코스트가 3 이하인 캐릭터를 2장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-095]],
    schema_version=1,
  })
end
