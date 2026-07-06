-- AUTO-GENERATED: EB01-040 / 퀴로스
-- rules_id=EB01-040 script_id=880000039 fingerprint=304745fb6127182e9f9ca2d238cd14c3c06105f5dbcad738773f2cf532e36dcf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-040]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
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
            count=1,
            faceup=true,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 라이프 위에서 1장을 앞면으로 할 수 있다: 상대의 코스트 0인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-040]],
    schema_version=1,
  })
end
