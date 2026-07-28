-- AUTO-GENERATED: OP15-106 / 문어 풍선
-- rules_id=OP15-106 script_id=880002408 fingerprint=1046c0471d8921f782194a799cb6aa90f7f739408ee52f6494aaf862b3b1d103
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-106]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            filter={
              card_type_any={
                [[CHARACTER]],
                [[STAGE]],
              },
              color=[[YELLOW]],
              cost_lte=2,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】카드를 1장 뽑는다. 그 후, 자신의 패에서 코스트 2 이하인 황색 캐릭터 카드나 스테이지 카드 1장까지를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-106]],
    schema_version=1,
  })
end
