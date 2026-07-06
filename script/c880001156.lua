-- AUTO-GENERATED: OP09-060 / 칼라이 바리섬
-- rules_id=OP09-060 script_id=880001156 fingerprint=8062afd71c38686d1b644786248e75bf142c16f2de09b99f6b223b39f6d7fab1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-060]],
    compile_status=[[AUTO]],
    effects={
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
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[크로스 길드]],
          },
        },
        costs={
          {
            count=2,
            filter={},
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패 2장을 원하는 순서대로 덱 맨 아래로 되돌리고, 이 스테이지를 레스트할 수 있다: 자신의 리더가 《크로스 길드》 특징을 가진 경우, 카드를 2장 뽑는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-060]],
    schema_version=1,
  })
end
