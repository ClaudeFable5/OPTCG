-- AUTO-GENERATED: OP08-036 / 일렉트리컬 루나
-- rules_id=OP08-036 script_id=880001012 fingerprint=9174b5e177f0a0a54374bbbbd32b8ae667d40605d2567b9eb1a2a41f7ed298e7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=0,
              filter={
                cost_lte=7,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】상대의 레스트 상태이고 코스트 7 이하인 모든 캐릭터는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
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
        source_text=[[상대의 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-036]],
    schema_version=1,
  })
end
