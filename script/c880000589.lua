-- AUTO-GENERATED: OP04-097 / 오타마
-- rules_id=OP04-097 script_id=880000589 fingerprint=26659fa3a418d832a49a925b89bb6c6aad9c19440b2f735ee11c61b64e1f03cd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-097]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            faceup=true,
            op=[[ADD_TO_OWNER_LIFE]],
            positions={
              [[LIFE_TOP]],
            },
            selector={
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
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 코스트 3 이하인 《동물》 또는 《SMILE》 특징을 가진 캐릭터를 1장까지 상대의 라이프 맨 위에 앞면으로 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-097]],
    schema_version=1,
  })
end
