-- AUTO-GENERATED: ST19-001 / 스모커
-- rules_id=ST19-001 script_id=880002090 fingerprint=89af9f4840b5d781ef2466ec1dc9a152a9f8332bbeb2b31f71b84894fd788de3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST19-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_ATTACK]],
            selector={
              count=2,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              color=[[BLACK]],
              trait=[[해군]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 흑색인 《해군》 특징을 가진 카드 1장을 버릴 수 있다: 다음 상대의 턴 종료 시까지, 상대의 코스트 4 이하인 캐릭터 2장까지는 어택할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST19-001]],
    schema_version=1,
  })
end
