-- AUTO-GENERATED: EB01-045 / 브룩
-- rules_id=EB01-045 script_id=880000044 fingerprint=9402a8719af16fc18e661a7609ab12b599f45070a8920bc871fb60fb458637bb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              cost_eq=0,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 코스트 0인 캐릭터가 있을 경우, 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-045]],
    schema_version=1,
  })
end
