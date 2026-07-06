-- AUTO-GENERATED: OP02-024 / 모비딕 호
-- rules_id=OP02-024 script_id=880000268 fingerprint=1aff82dcfcf5ef843651d5ae74aaba09752ea87935af0b92ce1be96871593f28
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                any={
                  {
                    name=[[에드워드 뉴게이트]],
                  },
                  {
                    trait_contains=[[흰 수염 해적단]],
                  },
                },
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=1,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】자신의 라이프가 1장 이하인 경우, 자신의 「에드워드 뉴게이트」와 『흰 수염 해적단』을 포함한 특징을 가진 모든 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-024]],
    schema_version=1,
  })
end
