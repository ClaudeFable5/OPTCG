-- AUTO-GENERATED: OP06-085 / 쿠마시
-- rules_id=OP06-085 script_id=880000819 fingerprint=7f25f502d6229b94dd4d1c1d709bbe8d50811872715defa0e599944c6f546aef
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-085]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            divisor=5,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER_PER_COUNT]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source=[[TRASH]],
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【자신의 턴 동안】자신의 트래시에 있는 카드 5장당, 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-085]],
    schema_version=1,
  })
end
