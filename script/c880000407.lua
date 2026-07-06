-- AUTO-GENERATED: OP03-041 / 우솝
-- rules_id=OP03-041 script_id=880000407 fingerprint=addef6a99b4f74f218f24b14c0046ee8bde710a6f8cdb8f6c97037ebb7260a81
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-041]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=7,
            mode=[[OPTIONAL]],
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터의 어택으로 상대의 라이프에 대미지를 주었을 때, 자신의 덱 위에서 7장을 트래시에 놓을 수 있다.]],
        timings={
          [[ON_DAMAGE_TO_OPPONENT_LIFE]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP03-041]],
    schema_version=1,
  })
end
