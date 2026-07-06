-- AUTO-GENERATED: ST25-004 / 버기
-- rules_id=ST25-004 script_id=880001988 fingerprint=2f9b626eca7d19b02af96faf97ac2cd74bb59a5b965ccb53819e10f4a9671ef5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST25-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=6,
              trait=[[크로스 길드]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[버기]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패 1장을 버리고, 이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 「버기」인 경우, 자신의 패에서 코스트 6 이하인 《크로스 길드》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST25-004]],
    schema_version=1,
  })
end
