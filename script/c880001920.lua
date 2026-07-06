-- AUTO-GENERATED: ST14-002 / 우솝
-- rules_id=ST14-002 script_id=880001920 fingerprint=549d28d55eab224c41baf710607aa5552831512b7474bd69e601d688697de146
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST14-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
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
        conditions={
          {
            filter={
              cost_gte=8,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 코스트 8 이상인 캐릭터가 있을 경우, 상대의 코스트 4 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST14-002]],
    schema_version=1,
  })
end
