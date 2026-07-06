-- AUTO-GENERATED: EB02-011 / 아론
-- rules_id=EB02-011 script_id=880000072 fingerprint=0b6bf3c86e61dbb675e153438579532680bb90fea40288bfd9c96377d8fe3ab3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_BE_RESTED]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT_ANY]],
            player=[[YOU]],
            traits={
              [[어인족]],
              [[이스트 블루]],
            },
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《어인족》 또는 《이스트 블루》 특징을 가진 경우, 자신의 리더 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다. 그 후, 다음 상대의 턴 종료 시까지, 상대의 코스트 5 이하인 캐릭터 1장까지는 레스트할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-011]],
    schema_version=1,
  })
end
