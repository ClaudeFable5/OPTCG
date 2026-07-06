-- AUTO-GENERATED: OP08-118 / 실버즈 레일리
-- rules_id=OP08-118 script_id=880001094 fingerprint=1dfde1f98cd5ff9a3ec74469ab6749170886aad7899b6add7a8ead86acc7e573
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-118]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_POWER_SPLIT]],
            primary_amount=-3000,
            primary_count=1,
            secondary_amount=-2000,
            selector={
              count=2,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                power_lte=3000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】다음 상대의 턴 종료 시까지, 상대의 캐릭터를 2장까지 선택해 1장을 파워 -3000하고, 나머지는 파워 -2000. 그 후, 상대의 파워 3000 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-118]],
    schema_version=1,
  })
end
