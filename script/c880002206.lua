-- AUTO-GENERATED: OP14-041 / 보아 행콕
-- rules_id=OP14-041 script_id=880002206 fingerprint=3e4c74585c6c4ffe65b1227ef55595f5c8fbb98eede862e0b7b3882aa824afcb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-041]],
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
            op=[[OPPONENT_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 캐릭터가 등장했을 때, 카드를 1장 뽑는다.]],
        timings={
          [[ON_OWN_CHARACTER_PLAYED]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[OPPONENT]],
            position=[[TOP]],
          },
        },
        conditions={
          {
            op=[[EVENT_TARGET_TRAIT_CONTAINS]],
            owner=[[YOU]],
            traits={
              [[아마존 릴리]],
              [[구사 해적단]],
            },
          },
          {
            amount=5000,
            op=[[EVENT_TARGET_BASE_POWER_GTE]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【턴 1회】자신의 원래 파워가 5000 이상인 《아마존 릴리》나 《구사 해적단》 특징을 가진 캐릭터가 KO 되었을 때, 상대의 라이프 위에서 1장까지를 주인의 패에 더한다.]],
        timings={
          [[ON_ANY_CHARACTER_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-041]],
    schema_version=1,
  })
end
