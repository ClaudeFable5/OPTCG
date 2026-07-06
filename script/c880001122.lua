-- AUTO-GENERATED: OP09-027 / 사보
-- rules_id=OP09-027 script_id=880001122 fingerprint=c25ede1c2c7065d2c833370f8cec90c9ca450aa662ca604b69166f4192c9349a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=3,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【어택 시】【턴 1회】자신의 레스트 상태인 캐릭터가 3장 이상인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-027]],
    schema_version=1,
  })
end
