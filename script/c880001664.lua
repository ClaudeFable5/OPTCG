-- AUTO-GENERATED: OP13-092 / 묘스가르드 성
-- rules_id=OP13-092 script_id=880001664 fingerprint=80a4ca2dcab8decfaf10077493e8c76df0e3dbcb0f98ce5e664d072874b3b0ad
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-092]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[STAGE]],
              cost_eq=1,
              trait=[[성지 마리조아]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            count=3,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프가 3장 이하인 경우, 자신의 트래시에서 코스트 1인 《성지 마리조아》 특징을 가진 스테이지 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-092]],
    schema_version=1,
  })
end
