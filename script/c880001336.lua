-- AUTO-GENERATED: OP11-002 / 아인
-- rules_id=OP11-002 script_id=880001336 fingerprint=39586394adcc04cddf17c29bce6f56bee5665077451325540143abe6b67ef277
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
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
                power_lte=0,
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
        source_text=[[【등장 시】이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -1000. 그 후, 상대의 파워 0 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-002]],
    schema_version=1,
  })
end
