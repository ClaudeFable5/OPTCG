-- AUTO-GENERATED: ST20-004 / 샬롯 푸딩
-- rules_id=ST20-004 script_id=880002098 fingerprint=da64a902e61310dbcdaf09c0366873de050fdcc94879a1c61cd87f67be28e0a7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST20-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=3,
                trait=[[빅 맘 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위에서 1장을 패에 더할 수 있다: 자신의 코스트 3 이하인 《빅 맘 해적단》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LIFE_TRIGGER_ACTIVATED]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】상대의 코스트 3 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST20-004]],
    schema_version=1,
  })
end
