-- AUTO-GENERATED: OP09-092 / 마샬 D. 티치
-- rules_id=OP09-092 script_id=880001188 fingerprint=96bb846ad42d45df85fc09a1d25ad4f583fb524e506a959f5507f27ba93c849f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-092]],
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
                count=3,
                op=[[HAND_BEHIND_BY_GTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 자신의 패가 상대의 패보다 3장 이상 적은 경우, 카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-092]],
    schema_version=1,
  })
end
