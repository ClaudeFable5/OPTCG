-- AUTO-GENERATED: ST17-001 / 크로커다일
-- rules_id=ST17-001 script_id=880002083 fingerprint=d6a29bf7e333ebfb9f8e462ca08c74110c0c1dd989a2ab7ab34f5cfd08604796
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST17-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              trait=[[왕의 부하 칠무해]],
            },
            on_match={
              {
                count=2,
                op=[[DRAW]],
                player=[[YOU]],
              },
              {
                count=1,
                op=[[RETURN_HAND_TO_DECK]],
                order=[[CHOOSE]],
                player=[[YOU]],
                positions={
                  [[DECK_TOP]],
                },
                ["then"]=true,
              },
            },
            op=[[REVEAL_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 1장을 공개하고, 그 카드가 《왕의 부하 칠무해》 특징을 가진 경우, 카드를 2장 뽑고 자신의 패 1장을 덱 맨 위로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST17-001]],
    schema_version=1,
  })
end
