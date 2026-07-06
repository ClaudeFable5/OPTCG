-- AUTO-GENERATED: ST13-017 / 화염 용왕
-- rules_id=ST13-017 script_id=880001916 fingerprint=728e4bc348ba43ce7c933e7829e75a3be20060780cd0cbeb14944deba2529f30
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-017]],
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
            op=[[LOOK_REORDER_ALL_LIFE]],
            order=[[CHOOSE]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +4000. 그 후, 자신의 모든 라이프를 보고, 원하는 순서대로 놓는다.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_HAND]],
            player=[[YOU]],
            position=[[LIFE_TOP]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 자신의 패를 1장까지 라이프 맨 위에 더한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST13-017]],
    schema_version=1,
  })
end
