-- AUTO-GENERATED: EB03-013 / 캐럿
-- rules_id=EB03-013 script_id=880002116 fingerprint=f4406c5a33002be2988496e3f484a91f4ce0beb212d523f60167fe1b2d741133
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=5,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              name=[[조]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[SELF_PLAYED_THIS_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이 캐릭터가 등장한 턴인 경우, 상대의 레스트 상태이고 코스트 5 이하인 캐릭터를 1장까지 KO 시킨다. 그 후, 자신의 패에서 「조」를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-013]],
    schema_version=1,
  })
end
