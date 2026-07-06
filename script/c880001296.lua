-- AUTO-GENERATED: OP10-081 / 우솝
-- rules_id=OP10-081 script_id=880001296 fingerprint=f799c955c9b5fb596634d84df19dec5d4221f2463a04ddb8242d4ba3eeb9af73
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-081]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=2,
            op=[[MILL_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[드레스로자]],
            },
            kinds={
              [[LEADER]],
              [[STAGE]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 《드레스로자》 특징을 가진 리더 또는 스테이지 1장을 레스트할 수 있다: 상대의 코스트 2 이하인 캐릭터를 1장까지 KO 시킨다. 그 후, 자신의 덱 위에서 2장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-081]],
    schema_version=1,
  })
end
