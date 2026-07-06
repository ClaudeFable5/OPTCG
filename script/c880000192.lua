-- AUTO-GENERATED: OP01-069 / 시저 클라운
-- rules_id=OP01-069 script_id=880000192 fingerprint=b0d7c463208615b95a498da0366973794aa50a85ec3986086b6c8b65e9dbf98e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-069]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              name=[[스마일리]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_DECK]],
            player=[[YOU]],
            rested=false,
          },
          {
            op=[[SHUFFLE_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 덱에서 「스마일리」를 1장까지 등장시키고 덱을 섞는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-069]],
    schema_version=1,
  })
end
