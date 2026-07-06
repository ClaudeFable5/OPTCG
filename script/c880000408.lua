-- AUTO-GENERATED: OP03-042 / 우솝 해적단
-- rules_id=OP03-042 script_id=880000408 fingerprint=54cc1bf3a7d70e11485d6e44e30079595bcf3a750ee2270be75afde163546e6c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-042]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              color=[[BLUE]],
              name=[[우솝]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 청색인 「우솝」을 1장까지 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-042]],
    schema_version=1,
  })
end
