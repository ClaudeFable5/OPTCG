-- AUTO-GENERATED: OP11-074 / 슈트로이젠
-- rules_id=OP11-074 script_id=880001408 fingerprint=15325bc37b53f7e492768a49227092a73d4f063a9145d31313b5e23b2b32a108
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-074]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            on_match={
              {
                op=[[REST]],
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
            op=[[DECLARE_COST_REVEAL]],
            player=[[YOU]],
            reveal_player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-1, 이 캐릭터를 레스트할 수 있다: 임의의 코스트를 선언하고, 상대의 덱 위에서 1장을 공개한다. 공개한 카드가 선언한 코스트와 같은 경우, 상대의 코스트 4 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-074]],
    schema_version=1,
  })
end
