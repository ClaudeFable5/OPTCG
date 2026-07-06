-- AUTO-GENERATED: ST12-006 / 요삭 & 조니
-- rules_id=ST12-006 script_id=880001888 fingerprint=994f1021ebb025e8f9f5f6a7fb101520b89e03bc809bc6337ac658f32962d9c2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST12-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            options={
              {
                {
                  op=[[REST]],
                  selector={
                    count=1,
                    filter={
                      cost_lte=2,
                    },
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[OPPONENT]],
                  },
                },
              },
              {
                {
                  op=[[KO]],
                  selector={
                    count=1,
                    filter={
                      cost_lte=2,
                      state=[[RESTED]],
                    },
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[OPPONENT]],
                  },
                },
              },
            },
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】아래에서 하나를 선택한다.
・상대의 코스트 2 이하인 캐릭터를 1장까지 레스트로 한다.
・상대의 레스트 상태이고 코스트 2 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST12-006]],
    schema_version=1,
  })
end
