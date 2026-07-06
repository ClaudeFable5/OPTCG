-- AUTO-GENERATED: OP11-085 / 쿠로즈미 오로치
-- rules_id=OP11-085 script_id=880001419 fingerprint=86c160844fd85b24048392b5da082618326fbbac5b03ac45dc5963cc8f1d90eb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-085]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              cost_lte=5,
              trait=[[SMILE]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 코스트 5 이하인 《SMILE》 특징을 가진 카드를 1장까지 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-085]],
    schema_version=1,
  })
end
