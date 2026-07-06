-- AUTO-GENERATED: OP08-119 / 카이도 & 링링
-- rules_id=OP08-119 script_id=880001095 fingerprint=e41737d8a1255ebb49813f61f6cead90a5986103a931817e2e3c085207fc0414
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-119]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=0,
              filter={
                exclude_self=true,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[ANY]],
            },
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
            ["then"]=true,
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TRASH_LIFE_TOP]],
            player=[[OPPONENT]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=10,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】두웅!!-10: 이 캐릭터 이외의 모든 캐릭터를 KO 시킨다. 그 후, 자신의 덱 위에서 1장까지를 라이프 맨 위에 더하고, 상대의 라이프 위에서 1장까지를 트래시로 보낸다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-119]],
    schema_version=1,
  })
end
