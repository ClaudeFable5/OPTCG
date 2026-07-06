-- AUTO-GENERATED: OP12-062 / 빈스모크 소라
-- rules_id=OP12-062 script_id=880001515 fingerprint=b1779e1af49cc2bdc0c1e92b78257872586c1347bb88c5c074fb6404ccfbd357
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-062]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            name=[[상디]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
          {
            op=[[FIELD_DON_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「상디」이고, 자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하인 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다. 그 후, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-062]],
    schema_version=1,
  })
end
