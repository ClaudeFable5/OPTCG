-- AUTO-GENERATED: OP14-028 / 조니
-- rules_id=OP14-028 script_id=880002193 fingerprint=88a524fcebbfee4da77080c00ada79a357f242d7fdd0c5e6ee9ba44094618f3b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-028]],
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
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】이 캐릭터가 레스트가 되었을 때, 상대의 레스트 상태인 코스트 2 이하의 캐릭터 1장까지를 KO 시킨다.]],
        timings={
          [[ON_SELF_RESTED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-028]],
    schema_version=1,
  })
end
