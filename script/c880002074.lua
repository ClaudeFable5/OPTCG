-- AUTO-GENERATED: P-118 / 릴리스
-- rules_id=P-118 script_id=880002074 fingerprint=fe1ef92378747ccf1c2f7676a795b6ee6333df275c104c36257b8b578692973c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-118]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              any={
                {
                  trait=[[에그 헤드]],
                },
                {
                  has_trigger=true,
                },
              },
              card_type=[[CHARACTER]],
              cost_lte=5,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[에그 헤드]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《에그 헤드》 특징을 가진 경우, 자신의 패에서 코스트 5 이하인 《에그 헤드》 특징 또는 【트리거】를 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-118]],
    schema_version=1,
  })
end
