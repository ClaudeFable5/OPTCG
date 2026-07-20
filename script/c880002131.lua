-- AUTO-GENERATED: EB03-028 / 유우
-- rules_id=EB03-028 script_id=880002131 fingerprint=73bd2820774ccf1616d26391ff73b0687d7b3f94a4c2b9b7404f2a1d57ca3628
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=4,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 패가 4장 이하인 경우, 카드를 2장 뽑는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-028]],
    schema_version=1,
  })
end
