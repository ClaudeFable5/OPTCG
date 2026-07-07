-- AUTO-GENERATED: ST19-005 / 몽키 D. 가프
-- rules_id=ST19-005 script_id=880002094 fingerprint=fe9dc17c1c882d5d92701f5efd732c7ab3998ef9348d124413af6fe709e94b3c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST19-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 트래시에서 카드 1장을 덱 맨 아래로 되돌릴 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -1.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST19-005]],
    schema_version=1,
  })
end
