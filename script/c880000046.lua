-- AUTO-GENERATED: EB01-047 / 라분
-- rules_id=EB01-047 script_id=880000046 fingerprint=fa24ef6452319994a64247ebd2a28052dfa1077e29e5eb1031c197b16fe08b26
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-047]],
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
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】캐릭터가 KO 당했을 때, 카드를 1장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_ANY_CHARACTER_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-047]],
    schema_version=1,
  })
end
