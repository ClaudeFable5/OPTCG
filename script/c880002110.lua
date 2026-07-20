-- AUTO-GENERATED: EB03-007 / 바카라
-- rules_id=EB03-007 script_id=880002110 fingerprint=4aca28d5d4104c6224d1cdc1c702fdae80cc3823efc96c5c137b160db0bb082f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
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
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 파워 6000 이하이고 원래 효과가 없는 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB03-007]],
    schema_version=1,
  })
end
