-- AUTO-GENERATED: ST06-015 / 대분화
-- rules_id=ST06-015 script_id=880001814 fingerprint=9df33a6b4d73d21efb88d1e858e4fe7499638b9e5ea8327013af2d647580cb4a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST06-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            amount=-2,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】카드를 1장 뽑는다. 그 후, 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -2.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대는 자신의 패 1장을 버린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST06-015]],
    schema_version=1,
  })
end
