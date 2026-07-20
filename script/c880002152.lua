-- AUTO-GENERATED: EB03-049 / 역시 너희들이군, 이 대소동.
-- rules_id=EB03-049 script_id=880002152 fingerprint=0160c3dab62530ec725204226118c82d3b4bf00a50d02f5d2efe263fd09ec296
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-049]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=6,
              trait=[[스릴러 바크 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND_OR_TRASH]],
            player=[[YOU]],
            rested=false,
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[스릴러 바크 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND_OR_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[페로나]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=7,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 두웅!! 7장을 레스트할 수 있다: 자신의 리더가 「페로나」인 경우, 자신의 패 또는 트래시에서 《스릴러 바크 해적단》 특징을 가진 코스트 6 이하와 코스트 4 이하인 캐릭터 카드를 1장씩까지 등장시킨다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더의 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-049]],
    schema_version=1,
  })
end
