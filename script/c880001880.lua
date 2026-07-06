-- AUTO-GENERATED: ST11-003 / 역광
-- rules_id=ST11-003 script_id=880001880 fingerprint=0156af2b9fe392caf0ad9c382f8f659d061f6dab71714c8a7c62744b98f4ffb3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST11-003]],
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
                      cost_lte=5,
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
                      cost_lte=5,
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
        conditions={
          {
            name=[[우타]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 리더가 「우타」인 경우, 아래에서 하나를 선택한다.
・상대의 코스트 5 이하인 캐릭터를 1장까지 레스트로 한다.
・상대의 레스트 상태이고 코스트 5 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST11-003]],
    schema_version=1,
  })
end
