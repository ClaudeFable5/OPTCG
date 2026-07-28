-- AUTO-GENERATED: OP15-031 / 프린프린
-- rules_id=OP15-031 script_id=880002333 fingerprint=793973cd63e219d6a0676bf85201cb4884af4653e15e3939a12b6cbb14af8365
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-031]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_eq_attached_don=true,
                state=[[RESTED]],
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
        source_text=[[【등장 시】상대의 레스트 상태인 캐릭터 1장까지를 고른다. 고른 캐릭터의 코스트가 그 캐릭터에 부여된 두웅!!의 수와 같은 경우, KO한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-031]],
    schema_version=1,
  })
end
