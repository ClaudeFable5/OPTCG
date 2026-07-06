-- AUTO-GENERATED: ST02-017 / 짚꾸러미 칼
-- rules_id=ST02-017 script_id=880001746 fingerprint=b8b0022c8e7f98ba32b561068a67fb1612ce6d30544bb686fbf5e3dad091891d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST02-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】상대의 캐릭터 1장까지 레스트 한다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              cost_lte=2,
              trait=[[초신성]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 패에서 코스트 2 이하 《초신성》 특징을 가진 카드를 1장까지 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST02-017]],
    schema_version=1,
  })
end
