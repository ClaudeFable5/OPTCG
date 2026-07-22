-- AUTO-GENERATED: OP14-083 / 미스 웬즈데이
-- rules_id=OP14-083 script_id=880002248 fingerprint=c85d4b3d2e68bdaaf960b4a0c26ebedc48a913d1c8802875099e662b5d4db6b2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-083]],
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
              filter={
                cost_eq=0,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
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
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 이번 턴 동안, 상대의 코스트 0인 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-083]],
    schema_version=1,
  })
end
