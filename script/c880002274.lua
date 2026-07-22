-- AUTO-GENERATED: OP14-109 / 빅토리아 신드리
-- rules_id=OP14-109 script_id=880002274 fingerprint=c6d61363e64ada6b5c5c241f158a884708cfd9f0d461af6c70ac133f24009314
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-109]],
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
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP14-109]],
    schema_version=1,
  })
end
