-- AUTO-GENERATED: OP07-119 / 포트거스 D. 에이스
-- rules_id=OP07-119 script_id=880000976 fingerprint=f228c863cd1b0cf4865bb0e4cf7dc9278690e96032eef8a8cd02cdc2ea29706b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-119]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
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
                count=2,
                op=[[LIFE_LTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다. 그 후, 자신의 라이프가 2장 이하인 경우, 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-119]],
    schema_version=1,
  })
end
