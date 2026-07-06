-- AUTO-GENERATED: OP03-069 / 미노리노케로스
-- rules_id=OP03-069 script_id=880000435 fingerprint=1ef2f46965accc1844b99711bf781f18a9d55387b7cfe1fb4dbe8f7a590d5c22
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-069]],
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
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[임펠 다운]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 《임펠 다운》 특징을 가진 경우, 카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-069]],
    schema_version=1,
  })
end
