-- AUTO-GENERATED: OP06-101 / 오나미
-- rules_id=OP06-101 script_id=880000835 fingerprint=0f09c8e344a5fb89fccb588417e19acb6958de7305afd38d8fdacafd30eb15da
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-101]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[BANISH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 리더 또는 캐릭터 1장까지는 【배니시】를 얻는다.
(이 카드가 대미지를 주었을 경우, 트리거는 발동하지 않으며 그 카드는 트래시로 보내진다)]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 코스트 5 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-101]],
    schema_version=1,
  })
end
