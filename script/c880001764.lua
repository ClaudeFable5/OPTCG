-- AUTO-GENERATED: ST03-017 / 매료매료 멜로우
-- rules_id=ST03-017 script_id=880001764 fingerprint=1a52caad1b8449e3a37e607f0f3dc08dfd9f0c7664beca05f6532d10371ec13f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST03-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=4000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            actions={
              {
                count=1,
                op=[[DRAW]],
                player=[[YOU]],
              },
            },
            conditions={
              {
                count=3,
                op=[[HAND_LTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 중, 자신의 리더 또는 캐릭터 1장까지의 파워 +4000. 그후, 자신의 패가 3장 이하인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST03-017]],
    schema_version=1,
  })
end
