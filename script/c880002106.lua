-- AUTO-GENERATED: EB03-003 / 우타
-- rules_id=EB03-003 script_id=880002106 fingerprint=b32b7b87ed1de3a92d65accb6113e59ad958a183c350d06727b2a51e6d3256ac
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_lte=6000,
              vanilla=true,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={
          {
            name=[[우타]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「우타」인 경우, 카드를 2장 뽑는다. 그 후, 자신의 패에서 파워 6000 이하이고 원래 효과가 없는 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-003]],
    schema_version=1,
  })
end
