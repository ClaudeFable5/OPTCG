-- AUTO-GENERATED: OP13-007 / 에이스 & 사보 & 루피
-- rules_id=OP13-007 script_id=880001579 fingerprint=4685ff016c4e77fa423947b83d8f45cbe54ea50795c282a3c749c0ce5f5bf1d3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            state=[[ACTIVE]],
          },
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 리더 또는 캐릭터 1장에게 자신의 액티브 상태인 두웅!! 1장을 부여하고, 이 캐릭터를 트래시에 놓을 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-007]],
    schema_version=1,
  })
end
