-- AUTO-GENERATED: OP12-099 / 카르가라
-- rules_id=OP12-099 script_id=880001552 fingerprint=7ba8d6c85bfb87748f21a9e8885dc96d8e8eea0663a908f145ab8643d02b4f3d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-099]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_DRAW]],
            player=[[YOU]],
            reason=[[SELF_EFFECT]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】라이프가 줄어들었을 때, 카드를 1장 뽑는다. 그 후, 이번 턴 동안, 자신은 자신의 효과로 카드를 뽑을 수 없다.]],
        timings={
          [[ON_YOUR_LIFE_DECREASED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-099]],
    schema_version=1,
  })
end
