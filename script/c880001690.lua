-- AUTO-GENERATED: OP13-118 / 몽키 D. 루피
-- rules_id=OP13-118 script_id=880001690 fingerprint=53761747831cb508c36d8cf09bb111378da43ce05edd4a5c3032242ac7d681a3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-118]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=4,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
          {
            duration=[[THIS_TURN]],
            filter={
              base_cost_gte=5,
              card_type=[[CHARACTER]],
            },
            op=[[CANNOT_PLAY]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_IS_MULTICOLOR]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 다색인 경우, 자신의 두웅!!을 4장까지 액티브로 한다. 그 후, 이번 턴 동안, 자신은 원래 코스트가 5 이상인 캐릭터 카드를 등장시킬 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[DOUBLE_ATTACK]],
    },
    rules_id=[[OP13-118]],
    schema_version=1,
  })
end
