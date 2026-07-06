-- AUTO-GENERATED: EB01-061 / Mr.2 봉쿠레(벤담)
-- rules_id=EB01-061 script_id=880000061 fingerprint=9ee1d23d09cda05ac236264ead1a6d9ea3a82ac90a7647cafe639e92bb4f0b6c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-061]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[SET_BASE_POWER_FROM_TARGET]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source_selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】상대의 캐릭터를 1장까지 선택한다. 이번 턴 동안, 이 캐릭터의 원래 파워는 선택한 캐릭터와 동일한 파워가 된다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-061]],
    schema_version=1,
  })
end
