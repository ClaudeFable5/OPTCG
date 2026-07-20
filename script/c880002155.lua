-- AUTO-GENERATED: EB03-052 / 시라호시
-- rules_id=EB03-052 script_id=880002155 fingerprint=d57b0459b4a137ac432f85fe4fc3b0ec3c09b15b5b8105c15f1f69fd4bcc6aef
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-052]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              filter={
                trait=[[해왕류]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            name=[[시라호시]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 「시라호시」인 경우, 자신의 덱 위에서 1장을 라이프 맨 위에 더한다. 그 후, 이번 턴 동안, 자신의 《해왕류》 특징을 가진 모든 캐릭터의 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-052]],
    schema_version=1,
  })
end
