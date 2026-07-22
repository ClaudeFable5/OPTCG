-- AUTO-GENERATED: OP14-046 / 코알라
-- rules_id=OP14-046 script_id=880002211 fingerprint=c8a7cf01ede1de7ee6b9fe797582cee2807b79244d784b4ab3a95f21e77be07d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait_any={
                  [[어인족]],
                  [[인어족]],
                },
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 이번 턴 동안, 자신의 《어인족》이나 《인어족》 특징을 가진 리더 또는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-046]],
    schema_version=1,
  })
end
