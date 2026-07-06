-- AUTO-GENERATED: OP11-066 / 샬롯 오븐
-- rules_id=OP11-066 script_id=880001400 fingerprint=e87a6c2945b07a7f33699a1cbfc21ca1bb43b7544d9d408892da9e8ff39af47c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-066]],
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
                    base_cost_lte=3,
                  },
                  kind=[[CHARACTER]],
                  mode=[[UP_TO]],
                  owner=[[OPPONENT]],
                },
              },
              {
                count=1,
                mode=[[UP_TO]],
                op=[[ADD_DON]],
                state=[[RESTED]],
                ["then"]=true,
              },
            },
            op=[[DECLARE_COST_REVEAL]],
            player=[[YOU]],
            reveal_player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 임의의 코스트를 선언하고, 상대의 덱 위에서 1장을 공개한다. 공개한 카드가 선언한 코스트와 같은 경우, 상대의 원래 코스트가 3 이하인 캐릭터를 1장까지 KO 시킨다. 그 후, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-066]],
    schema_version=1,
  })
end
