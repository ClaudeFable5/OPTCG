-- AUTO-GENERATED: OP09-021 / 레드 포스 호
-- rules_id=OP09-021 script_id=880001116 fingerprint=3e38d4bcda1c7aa370b3380b3bc3e5ea3727962cdfc70571a43aff83263e9de4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1000,
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
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[빨간 머리 해적단]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 스테이지를 레스트할 수 있다: 자신의 리더가 《빨간 머리 해적단》 특징을 가진 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-021]],
    schema_version=1,
  })
end
