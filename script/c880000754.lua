-- AUTO-GENERATED: OP06-020 / 호디 존스
-- rules_id=OP06-020 script_id=880000754 fingerprint=183b556ee43490fda80c4b8bfcba3a996f0e8fd2220cece69d65e65948a2c840
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-020]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            count=1,
            mode=[[UP_TO]],
            op=[[REST_CARD_OR_DON]],
            player=[[OPPONENT]],
          },
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            source=[[OWN_EFFECT]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 리더를 레스트할 수 있다: 상대의 코스트 3 이하인 캐릭터 또는 두웅!!을 1장까지 레스트로 한다. 그 후, 이번 턴 동안, 자신은 자신의 효과로 라이프를 패에 더할 수 없다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-020]],
    schema_version=1,
  })
end
