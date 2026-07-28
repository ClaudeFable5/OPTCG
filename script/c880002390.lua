-- AUTO-GENERATED: OP15-088 / 파이러츠 도킹6
-- rules_id=OP15-088 script_id=880002390 fingerprint=9f72132cc1fd4b7c85d100c6b8b5dcb65da678cbecfcf3243f3c617eb8f12363
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-088]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=6,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터의 코스트 +6.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=2,
              trait=[[밀짚모자 일당]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[MILL_DECK]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 트래시에 놓을 수 있다: 자신의 트래시에서 코스트 2 이하인 《밀짚모자 일당》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-088]],
    schema_version=1,
  })
end
