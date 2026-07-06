-- AUTO-GENERATED: OP10-096 / 왕의 부하 칠무해는 이제 필요없소………!!!
-- rules_id=OP10-096 script_id=880001311 fingerprint=396b89d300cd3f9894be10c8743ebb9aba5c3348c77d8e1ae6877d031c911d79
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-096]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=8,
                trait=[[왕의 부하 칠무해]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】상대의 코스트 8 이하인 《왕의 부하 칠무해》 특징을 가진 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=4,
                trait=[[왕의 부하 칠무해]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 코스트 4 이하인 《왕의 부하 칠무해》 특징을 가진 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-096]],
    schema_version=1,
  })
end
