-- AUTO-GENERATED: OP08-111 / S-샤크
-- rules_id=OP08-111 script_id=880001087 fingerprint=31dae229198956ecdfefb89bfb524a64dc57a09f8099272c3b5262e69cd8e348
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-111]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】이번 배틀 동안, 상대는 【블로커】를 발동할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            count=2,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 패 1장을 버릴 수 있다: 자신의 라이프가 2장 이하인 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-111]],
    schema_version=1,
  })
end
