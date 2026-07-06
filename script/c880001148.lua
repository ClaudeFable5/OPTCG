-- AUTO-GENERATED: OP09-052 / 마르코
-- rules_id=OP09-052 script_id=880001148 fingerprint=23466dd12f279345afd5a0a822cffaf8b711b31f8550ec064b3bea9c385776c4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-052]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=true,
            source=[[TRASH]],
          },
        },
        conditions={
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 패 1장을 버릴 수 있다: 이 캐릭터가 상대의 효과로 KO 당했을 때, 이 캐릭터 카드를 트래시에서 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_KO_BY_OPPONENT_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-052]],
    schema_version=1,
  })
end
