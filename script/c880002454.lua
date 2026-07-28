-- AUTO-GENERATED: EB04-033 / 그로키 몬스터스
-- rules_id=EB04-033 script_id=880002454 fingerprint=6fea7dc3747b94dbd9a3d8b0e570a160f1acbc5b74be33b7c62edc7722bf44ec
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=6000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            count=3,
            filter={
              trait=[[폭시 해적단]],
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1: 자신의 《폭시 해적단》 특징을 가진 캐릭터가 3장 이상 있는 경우, 상대의 원래 파워 6000 이하인 캐릭터 1장까지를 KO한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-033]],
    schema_version=1,
  })
end
