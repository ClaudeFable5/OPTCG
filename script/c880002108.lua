-- AUTO-GENERATED: EB03-005 / 슈거
-- rules_id=EB03-005 script_id=880002108 fingerprint=b35cede14ff1ef507ae95e24a2c1c45022f0d93bd32d5306528aa9e7cb6df925
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_lte=6000,
              trait=[[돈키호테 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={
          {
            name=[[슈거]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「슈거」인 경우, 자신의 패에서 파워 6000 이하인 《돈키호테 해적단》 특징을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-005]],
    schema_version=1,
  })
end
