-- AUTO-GENERATED: EB03-051 / 샬롯 스무디
-- rules_id=EB03-051 script_id=880002154 fingerprint=26ebecaadc2be01c64c3a61f397d9c836552773617524a769254d321afdf8a5d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-051]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            op=[[SET_ALL_LIFE_FACE_DOWN]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[FACEUP_LIFE_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 앞면인 라이프가 있을 경우, 상대의 코스트 2 이하인 캐릭터를 1장까지 KO 시킨다. 그 후, 자신의 모든 라이프를 뒷면으로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-051]],
    schema_version=1,
  })
end
