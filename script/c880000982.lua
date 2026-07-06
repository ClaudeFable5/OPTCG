-- AUTO-GENERATED: OP08-006 / 체스마리모
-- rules_id=OP08-006 script_id=880000982 fingerprint=2aaf985cf06e1faca7b8f044a43fe13bd441f553446ea715141439e92b7470c1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                amount=2000,
                duration=[[WHILE_CONDITION]],
                op=[[MODIFY_POWER]],
                selector={
                  count=1,
                  kind=[[SELF]],
                  mode=[[UP_TO]],
                  owner=[[YOU]],
                },
              },
            },
            conditions={
              {
                names={
                  [[쿠로마리모]],
                  [[체스]],
                },
                op=[[TRASH_CONTAINS_NAMES]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】자신의 트래시에 「쿠로마리모」와 「체스」가 있을 경우, 이 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-006]],
    schema_version=1,
  })
end
