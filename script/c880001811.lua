-- AUTO-GENERATED: ST06-012 / 몽키 D. 가프
-- rules_id=ST06-012 script_id=880001811 fingerprint=f604035fb0336975a5c21358c3a915dfe64c4badfaba1fcaa6f0ff0a79c48005
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST06-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
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
            count=1,
            op=[[TRASH_HAND]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패 1장을 버리고, 이 캐릭터를 레스트할 수 있다: 상대의 코스트 4 이하인 캐릭터를 1장까지 KO시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST06-012]],
    schema_version=1,
  })
end
