-- AUTO-GENERATED: EB03-041 / 쿠자쿠
-- rules_id=EB03-041 script_id=880002144 fingerprint=4045848927524f94ed8e7201335ed4a2be210a7645523caee31411a49785c97e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-041]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              filter={
                cost_lte=6,
                trait=[[SWORD]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 코스트 6 이하인 《SWORD》 특징을 가진 모든 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[해군]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 《해군》 특징을 가진 카드 1장을 버릴 수 있다: 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-041]],
    schema_version=1,
  })
end
