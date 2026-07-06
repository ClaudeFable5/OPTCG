-- AUTO-GENERATED: OP07-009 / 도구라 & 마구라
-- rules_id=OP07-009 script_id=880000862 fingerprint=5970e89d6f5b9b93fef0814570a072aca20fc8d4e3587749063e180f5629a6dd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[DOUBLE_ATTACK]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                color=[[RED]],
                cost_eq=1,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 코스트 1인 적색 캐릭터 1장까지는 【더블 어택】을 얻는다.
(이 카드가 주는 대미지는 2가 된다)]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-009]],
    schema_version=1,
  })
end
