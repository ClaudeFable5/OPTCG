-- AUTO-GENERATED: OP04-086 / 칭자오
-- rules_id=OP04-086 script_id=880000578 fingerprint=3c31da7c83decb3c9df014165db6138110b376a892894753f267959148c24391
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-086]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터의 배틀로 상대의 캐릭터를 KO 시켰을 때, 카드를 2장 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[ON_BATTLE_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-086]],
    schema_version=1,
  })
end
