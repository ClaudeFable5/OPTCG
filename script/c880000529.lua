-- AUTO-GENERATED: OP04-038 / 약한 녀석은 죽을 방식을 고르지도 못한다!!!
-- rules_id=OP04-038 script_id=880000529 fingerprint=60bd5e134b652f57bbe1f7f7beb3d6172ba9e401f51e93efd6289a5131f1b604
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-038]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=6,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】/【카운터】상대의 리더 또는 캐릭터를 1장까지 레스트로 한다. 그 후, 상대의 레스트 상태이고 코스트 6 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[MAIN]],
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=5,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 두웅!!을 5장까지 액티브로 한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-038]],
    schema_version=1,
  })
end
