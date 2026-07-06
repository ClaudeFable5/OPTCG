-- AUTO-GENERATED: OP13-023 / 우타
-- rules_id=OP13-023 script_id=880001595 fingerprint=8296b48f1c9726ef9808138a3812d0a4d744304a09660aef3760608c573609cc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-023]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 두웅!!을 2장까지 액티브로 한다. 그 후, 이번 턴 동안, 자신은 원래 코스트가 5 이상인 캐릭터 카드를 등장시킬 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 코스트 5 이하인 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-023]],
    schema_version=1,
  })
end
