-- AUTO-GENERATED: OP08-073 / 병아리 자작
-- rules_id=OP08-073 script_id=880001049 fingerprint=44e83d2c3b5c82b8782189761a75885e21e3c0ba1f84eb2ebab16f7f0eb349e7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-073]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=6,
              name=[[닭 백작]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_DECK]],
            player=[[YOU]],
            rested=false,
          },
          {
            op=[[SHUFFLE_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】【KO 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 덱에서 코스트 6 이하인 「닭 백작」을 1장까지 등장시킨다. 그 후, 덱을 섞는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-073]],
    schema_version=1,
  })
end
