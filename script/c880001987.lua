-- AUTO-GENERATED: ST25-003 / 크로커다일 & 미호크
-- rules_id=ST25-003 script_id=880001987 fingerprint=64ce090be8a29e86d5d7f3b0ff5cee4d7d1ae256ae2b2032bb712684de2f83f2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST25-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[크로스 길드]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 2장 뽑고, 자신의 패 1장을 버린다. 그 후, 자신의 패에서 코스트 4 이하인 《크로스 길드》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=1,
                op=[[TRASH_HAND]],
              },
            },
            selector={
              count=0,
              filter={
                trait=[[크로스 길드]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신의 《크로스 길드》 특징을 가진 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 자신의 패 1장을 버릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[ST25-003]],
    schema_version=1,
  })
end
