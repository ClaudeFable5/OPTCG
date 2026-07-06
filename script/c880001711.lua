-- AUTO-GENERATED: ST01-002 / 우솝
-- rules_id=ST01-002 script_id=880001711 fingerprint=7994395edde93e9110dcd3566bb093dfaca250352957260473a6e5901605f696
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST01-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            filter={
              power_gte=5000,
            },
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!x2】【어택 시】이번 배틀 중, 상대는 파워 5000 이상인 캐릭터의 【블로커】를 발동할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST01-002]],
    schema_version=1,
  })
end
