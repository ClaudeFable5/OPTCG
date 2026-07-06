-- AUTO-GENERATED: OP02-082 / 반디 월드
-- rules_id=OP02-082 script_id=880000327 fingerprint=ce9be77e7330cf4ca23ae82b910e8499a01eb8c2b629b6f7c7b6ea38f462150d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-082]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=792000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=8,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】두웅!!-8(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 이번 턴 동안, 이 캐릭터의 파워 +792000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-082]],
    schema_version=1,
  })
end
