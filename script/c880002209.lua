-- AUTO-GENERATED: OP14-044 / 에드워드 뉴게이트
-- rules_id=OP14-044 script_id=880002209 fingerprint=60ef460b35b6c219bcfd706cc34b5ee4f8eba566121c7a1b4b67825ec8d1fdce
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-044]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[REVEAL_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
          },
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
              },
            },
            conditions={
              {
                op=[[EVENT_TARGET_TRAIT_CONTAINS]],
                trait=[[흰 수염 해적단]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 1장을 공개하고, 그 카드가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP14-044]],
    schema_version=1,
  })
end
