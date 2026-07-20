-- AUTO-GENERATED: EB03-055 / 니코 로빈
-- rules_id=EB03-055 script_id=880002158 fingerprint=6cee1a565ed369aab844addcacaa5930c1c38765ff729fe42d3a599d11b329c5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-055]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밀짚모자 일당]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_LIFE_TOP]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위에서 1장을 트래시에 놓을 수 있다: 자신의 리더가 《밀짚모자 일당》 특징을 가진 경우, 자신의 덱 위에서 2장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DEAL_DAMAGE]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】【KO 시】상대에게 1 대미지를 줄 수 있다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-055]],
    schema_version=1,
  })
end
