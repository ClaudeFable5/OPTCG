-- AUTO-GENERATED: OP11-065 / 샬롯 아나나
-- rules_id=OP11-065 script_id=880001399 fingerprint=9b9e5a1cdfe8a31a12ef1fc1dea88a3e6ca5c28b8df4ae9970706dd87d5e1720
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-065]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              color=[[PURPLE]],
              name_neq=[[샬롯 아나나]],
              trait=[[빅 맘 해적단]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[「샬롯 아나나」 이외의 자신의 자색인 《빅 맘 해적단》 특징을 가진 캐릭터가 있을 경우, 이 캐릭터는 【블로커】를 얻는다.
(상대의 어택 선언 후, 이 카드를 레스트로 하고 어택의 대상을 이 카드로 할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-065]],
    schema_version=1,
  })
end
