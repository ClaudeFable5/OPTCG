-- AUTO-GENERATED: P-109 / 포트거스 D. 에이스
-- rules_id=P-109 script_id=880002071 fingerprint=00e8a43152ee080710c6b07cbc2194237975085865a3ad164544f078abdefd9c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-109]],
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
        source_text=[[【등장 시】자신의 덱 위에서 3장을 보고, 원하는 순서대로 덱 맨 위나 아래로 되돌린다. 그 후, 자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[P-109]],
    schema_version=1,
  })
end
