-- AUTO-GENERATED: OP02-002 / 몽키 D. 가프
-- rules_id=OP02-002 script_id=880000246 fingerprint=278917ade3f8276d4cee342186cafe60d68ecf25600de35d77e6cf7224525520
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-002]],
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
              filter={
                cost_lte=7,
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
        source_text=[[【자신의 턴 동안】이 리더 또는 자신의 캐릭터에게 두웅!!이 부여됐을 때, 이번 턴 동안, 상대의 코스트 7 이하인 캐릭터 1장까지의 코스트 -1.]],
        timings={
          [[ON_DON_ATTACHED_TO_OWN_FIELD]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-002]],
    schema_version=1,
  })
end
