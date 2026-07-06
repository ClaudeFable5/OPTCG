-- AUTO-GENERATED: OP02-069 / DEATH WINK
-- rules_id=OP02-069 script_id=880000314 fingerprint=82a032b1a19f6b26cd32cdb1ef85b322d2193ef8e4df92af75751de200dd77d4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-069]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=6000,
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
            count=2,
            op=[[DRAW_TO_HAND_COUNT]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +6000. 그 후, 자신의 패가 2장이 되도록 카드를 뽑는다.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=7,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[코스트 7 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-069]],
    schema_version=1,
  })
end
