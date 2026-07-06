-- AUTO-GENERATED: OP05-002 / 벨로 베티
-- rules_id=OP05-002 script_id=880000614 fingerprint=f184ea41ba6e8b87e11f000617dd5a35616a7a910fd4c15f7d10cfab0e547b77
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=3,
              filter={
                any={
                  {
                    trait=[[혁명군]],
                  },
                  {
                    has_trigger=true,
                  },
                },
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[혁명군]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패에서 《혁명군》 특징을 가진 카드 1장을 버릴 수 있다: 이번 턴 동안, 자신의 《혁명군》 특징 또는 【트리거】를 가진 캐릭터 3장까지의 파워 +3000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-002]],
    schema_version=1,
  })
end
