-- AUTO-GENERATED: ST01-017 / 사우전드 써니 호
-- rules_id=ST01-017 script_id=880001728 fingerprint=f5d3ec3b026995e3c0633c2debb5f5223c33f290eda13da96c684eca07d5d5d6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST01-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[밀짚모자 일당]],
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
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 스테이지를 레스트 할 수 있다: 이번 턴 동안, 자신의 《밀짚모자 일당》 특징을 가진 리더 또는 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST01-017]],
    schema_version=1,
  })
end
