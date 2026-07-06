-- AUTO-GENERATED: OP07-117 / 에그 헤드
-- rules_id=OP07-117 script_id=880000973 fingerprint=f3c9cfdf3a83cc5c83f50a614f7d5f54facdc4476e8c49019aa868ab2ab8b5ae
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-117]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=5,
                trait=[[에그 헤드]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
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
        source_text=[[【자신의 턴 종료 시】자신의 라이프가 3장 이하인 경우, 코스트 5 이하인 《에그 헤드》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-117]],
    schema_version=1,
  })
end
