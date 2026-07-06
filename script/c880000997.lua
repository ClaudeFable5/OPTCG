-- AUTO-GENERATED: OP08-021 / 캐럿
-- rules_id=OP08-021 script_id=880000997 fingerprint=8780fff1c0c08782eceac8d76f3113d3b2b2d2052dd5060cc2b606ef6966ddbb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                op=[[REST]],
                selector={
                  count=1,
                  filter={
                    cost_lte=5,
                  },
                  kind=[[CHARACTER]],
                  mode=[[UP_TO]],
                  owner=[[OPPONENT]],
                },
              },
            },
            conditions={
              {
                filter={
                  trait=[[밍크족]],
                },
                op=[[CHARACTER_EXISTS]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 《밍크족》 특징을 가진 캐릭터가 있을 경우, 상대의 코스트 5 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-021]],
    schema_version=1,
  })
end
