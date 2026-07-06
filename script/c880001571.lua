-- AUTO-GENERATED: OP12-118 / 쥬얼리 보니
-- rules_id=OP12-118 script_id=880001571 fingerprint=052ce7d72710a1e4fe14d639a2491f0cece1cd82dab0e9ed760d24c7e0c9f940
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-118]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=2,
                op=[[DRAW]],
                player=[[YOU]],
              },
              {
                count=1,
                op=[[TRASH_HAND]],
                player=[[YOU]],
                ["then"]=true,
              },
            },
            conditions={
              {
                count=8,
                op=[[RESTED_CARD_COUNT_GTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 레스트 상태인 카드가 8장 이상인 경우, 카드를 2장 뽑고, 자신의 패 1장을 버린다. 그 후, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP12-118]],
    schema_version=1,
  })
end
