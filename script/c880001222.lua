-- AUTO-GENERATED: OP10-007 / 시저 병사
-- rules_id=OP10-007 script_id=880001222 fingerprint=79a8758d0a3c3913e68b04c8556676c59b3da12a44129ea25e209555b2a78e0f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=2,
              trait=[[펑크 하자드]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 코스트 2 이하인 《펑크 하자드》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-007]],
    schema_version=1,
  })
end
