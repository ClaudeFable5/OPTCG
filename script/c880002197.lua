-- AUTO-GENERATED: OP14-032 / 휴먼드릴
-- rules_id=OP14-032 script_id=880002197 fingerprint=0feea09e9aba13d8e51e9eb4dd9039e919651287e18afc116c47a21238c78e15
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=4,
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
        source_text=[[【자신의 턴 동안】이 캐릭터가 레스트가 되었을 때, 상대의 코스트 4 이하인 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ON_SELF_RESTED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-032]],
    schema_version=1,
  })
end
