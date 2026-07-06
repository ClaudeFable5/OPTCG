-- AUTO-GENERATED: OP08-016 / Dr. 히루루크
-- rules_id=OP08-016 script_id=880000992 fingerprint=5682526954c280f80c4fefd71a4562f00167ae373f94ee2fd4598b8b0659178e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                name=[[토니토니 쵸파]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            name=[[토니토니 쵸파]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 자신의 리더가 「토니토니 쵸파」인 경우, 이번 턴 동안, 자신의 캐릭터인 모든 「토니토니 쵸파」의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-016]],
    schema_version=1,
  })
end
