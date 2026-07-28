-- AUTO-GENERATED: OP15-093 / 리스키 형제
-- rules_id=OP15-093 script_id=880002395 fingerprint=e14e4ebc929a5cd97e918a0e1ec37d6d84bf30dce77e9c11cf198935e43531a3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-093]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[ALLOW_ATTACK_CHARACTER]],
            selector={
              count=1,
              filter={
                name=[[몽키 D. 루피]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            attribute=[[SLASH]],
            duration=[[THIS_TURN]],
            op=[[GAIN_ATTRIBUTE]],
            selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
          },
        },
        conditions={
          {
            count=15,
            op=[[TRASH_GTE]],
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
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 트래시가 15장 이상인 경우, 자신의 캐릭터 「몽키 D. 루피」 1장까지는 이번 턴 동안 【속공: 캐릭터】와 속성(참)을 얻는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-093]],
    schema_version=1,
  })
end
