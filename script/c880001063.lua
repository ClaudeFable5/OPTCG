-- AUTO-GENERATED: OP08-087 / 스크래치멘 아푸
-- rules_id=OP08-087 script_id=880001063 fingerprint=2cbbf2ab81caee6dac0834a351338b7db400ea03795e408b7657f77073cf4f2b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-087]],
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
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -1.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP08-087]],
    schema_version=1,
  })
end
