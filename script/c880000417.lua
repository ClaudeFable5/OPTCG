-- AUTO-GENERATED: OP03-051 / 벨메일
-- rules_id=OP03-051 script_id=880000417 fingerprint=442f1973883ef203880dc5b46e2d1b10e42ad2cb856d45131373aebc81073b4c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-051]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터의 어택으로 상대의 라이프에 대미지를 주었을 때, 자신의 덱 위에서 7장을 트래시에 놓을 수 있다.]],
        timings={
          [[ON_DAMAGE_TO_OPPONENT_LIFE]],
        },
      },
      {
        actions={
          {
            count=3,
            mode=[[OPTIONAL]],
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 덱 위에서 3장을 트래시에 놓을 수 있다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-051]],
    schema_version=1,
  })
end
