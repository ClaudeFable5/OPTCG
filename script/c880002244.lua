-- AUTO-GENERATED: OP14-079 / 크로커다일
-- rules_id=OP14-079 script_id=880002244 fingerprint=529a741be69b93db33307d330fc4eef0a20803b4107ada060ec477b68eb770e3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-079]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_LEAVE_FIELD]],
            reason=[[OPPONENT_EFFECT]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[상대의 모든 캐릭터는, 자신의 효과로 필드를 떠나지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            amount=-10,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=2,
            mode=[[OPTIONAL]],
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
              card_type=[[CHARACTER]],
              trait_contains=[[바로크 워크스]],
            },
            op=[[KO_OWN_CARD]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 『바로크 워크스』를 포함한 특징을 가진 캐릭터 1장을 KO 시킬 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -10. 그 후, 자신의 덱 위에서 2장을 트래시에 놓아도 된다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-079]],
    schema_version=1,
  })
end
