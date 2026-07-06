-- AUTO-GENERATED: OP04-083 / 사보
-- rules_id=OP04-083 script_id=880000575 fingerprint=a6ce9a37c69af618015e1f1315431d379688990c1d5192c106b9ed439d04bb91
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
            op=[[CANNOT_BE_KO]],
            reason=[[EFFECT]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
            ["then"]=true,
          },
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】다음 자신의 턴 개시 시까지, 자신의 모든 캐릭터는 효과로는 KO 당하지 않는다. 그 후, 카드를 2장 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP04-083]],
    schema_version=1,
  })
end
