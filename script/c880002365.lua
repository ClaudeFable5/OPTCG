-- AUTO-GENERATED: OP15-063 / 게다츠
-- rules_id=OP15-063 script_id=880002365 fingerprint=43f8d12c38f76d8c010b22d1a130b17f55c5c99412bdbce6e14fa4b1bac99050
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-063]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1: 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                power_lte=2000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            count=6,
            op=[[FIELD_DON_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 필드의 두웅!!이 6장 이하인 경우, 상대의 파워 2000 이하인 캐릭터 1장까지를 KO한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-063]],
    schema_version=1,
  })
end
