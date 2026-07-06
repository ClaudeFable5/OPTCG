-- AUTO-GENERATED: OP13-120 / 사보
-- rules_id=OP13-120 script_id=880001692 fingerprint=55507813461945df1b7268f001ffedcf8b4f224b0d41dfb4d22bdbb3cefb52fe
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-120]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
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
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】다음 상대의 턴 종료 시까지, 자신의 캐릭터 1장까지의 코스트 +2. 그 후, 자신의 리더에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP13-120]],
    schema_version=1,
  })
end
