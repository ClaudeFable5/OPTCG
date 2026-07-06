-- AUTO-GENERATED: OP11-081 / 코냑 파파인
-- rules_id=OP11-081 script_id=880001415 fingerprint=d3c6bbc0fd8844d47bd1bcea8a5823f6b28a12667c5ac7c99571ae8683065eea
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-081]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            on_match={
              {
                op=[[KO]],
                selector={
                  count=1,
                  filter={
                    base_cost_lte=8,
                  },
                  kind=[[CHARACTER]],
                  mode=[[UP_TO]],
                  owner=[[OPPONENT]],
                },
              },
            },
            op=[[DECLARE_COST_REVEAL]],
            player=[[YOU]],
            reveal_player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】임의의 코스트를 선언하고, 상대의 덱 위에서 1장을 공개한다. 공개한 카드가 선언한 코스트와 같은 경우, 상대의 원래 코스트가 8 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-081]],
    schema_version=1,
  })
end
