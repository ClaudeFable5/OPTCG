-- AUTO-GENERATED: OP02-095 / 오니구모
-- rules_id=OP02-095 script_id=880000340 fingerprint=0affe33f76ade6f692f1f8633f0be59c3f4004058bb62986f13001cc1281e135
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-095]],
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
            filter={
              cost_eq=0,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[ANY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[코스트 0인 캐릭터가 있을 경우, 이 캐릭터는 【배니시】를 얻는다.
(이 카드가 대미지를 주었을 경우, 트리거는 발동하지 않으며 그 카드는 트래시로 보내진다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-095]],
    schema_version=1,
  })
end
