-- AUTO-GENERATED: OP06-002 / 이나즈마
-- rules_id=OP06-002 script_id=880000736 fingerprint=83a30fd05995645d19ac77561080edd17608fd6bfe791c16509c49939a58ed4b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BANISH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            amount=7000,
            op=[[SELF_POWER_GTE]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터의 파워가 7000 이상인 경우, 이 캐릭터는 【배니시】를 얻는다.
(이 카드가 대미지를 주었을 경우, 트리거는 발동하지 않으며 그 카드는 트래시로 보내진다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-002]],
    schema_version=1,
  })
end
