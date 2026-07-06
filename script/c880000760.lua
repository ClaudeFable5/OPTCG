-- AUTO-GENERATED: OP06-026 / 코시로
-- rules_id=OP06-026 script_id=880000760 fingerprint=81c4031ee5287207197d35cfeb53e018b83796dd7d29999fb169466d095a8ba3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                attribute=[[SLASH]],
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_ATTACK_LEADER]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 코스트 4 이하인 <참격> 속성을 가진 캐릭터를 1장까지 액티브로 한다. 그 후, 이번 턴 동안, 자신은 리더를 어택할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-026]],
    schema_version=1,
  })
end
