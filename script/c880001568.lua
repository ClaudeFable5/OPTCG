-- AUTO-GENERATED: OP12-115 / 사랑한다!!
-- rules_id=OP12-115 script_id=880001568 fingerprint=a5e9185c43e9c9b79d0a13531d0c9342641aac2ed53cb8507e7c292c56674a78
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-115]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
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
                destination=[[HAND]],
                filter={
                  name=[[트라팔가 로]],
                },
                mode=[[UP_TO]],
                op=[[ADD_FROM_TRASH]],
                player=[[YOU]],
              },
            },
            conditions={
              {
                count=2,
                op=[[LIFE_LTE]],
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
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +2000. 그 후, 자신의 라이프가 2장 이하인 경우, 자신의 트래시에서 「트라팔가 로」를 1장까지 패에 더한다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-115]],
    schema_version=1,
  })
end
