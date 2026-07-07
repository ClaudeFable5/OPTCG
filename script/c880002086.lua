-- AUTO-GENERATED: ST17-004 / 보아 행콕
-- rules_id=ST17-004 script_id=880002086 fingerprint=2768b714d0053e12a37ab91ec807527d5cbef6ce52a15732bedbc65baac6a1ae
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST17-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                trait=[[왕의 부하 칠무해]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 원하는 순서대로 덱 맨 위나 아래로 되돌린다. 그 후, 자신의 《왕의 부하 칠무해》 특징을 가진, 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST17-004]],
    schema_version=1,
  })
end
