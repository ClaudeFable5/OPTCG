-- AUTO-GENERATED: OP07-081 / 칼리파
-- rules_id=OP07-081 script_id=880000936 fingerprint=b3d6804810da88c6ee8aefdaeb167802d22c79dcb5ef179cb85beb02808d6131
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-081]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_COST]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 동안】상대의 모든 캐릭터의 코스트 -1.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-081]],
    schema_version=1,
  })
end
