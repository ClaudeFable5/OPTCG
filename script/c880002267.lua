-- AUTO-GENERATED: OP14-102 / 쿠마시
-- rules_id=OP14-102 script_id=880002267 fingerprint=cb15949a295b2b686e9ab2eb4393efbb511af760cc4d098a7c136cd7e595da40
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-102]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[스릴러 바크 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 트래시에서 코스트 4 이하인 《스릴러 바크 해적단》 특징을 가진 캐릭터 카드 1장까지를 레스트로 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-102]],
    schema_version=1,
  })
end
